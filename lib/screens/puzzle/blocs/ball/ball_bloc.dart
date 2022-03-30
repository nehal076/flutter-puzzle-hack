import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way_for_ball/main.dart';
import 'package:way_for_ball/screens/puzzle/blocs/puzzle/puzzle_bloc.dart';
import 'package:way_for_ball/utils/arc_map.dart';
import 'package:way_for_ball/utils/levels_data.dart';
import 'package:way_for_ball/utils/popup/winning/win_popup.dart';
import 'package:way_for_ball/utils/shared_prefs.dart';

part 'ball_event.dart';
part 'ball_state.dart';

class BallBloc extends Bloc<BallEvent, BallState> {
  BallBloc() : super(BallInitial()) {
    on<InitalizeBall>(_initializeBall);
    on<RollBall>(_rollBall);
    on<UpdateBall>(_updateBall);
    on<UpdateLinearState>(_updateLinearState);
    on<UpdateCurveState>(_updateCurveState);
    on<BallInitalize>(_ballInitalize);
  }

  bool gameHasStarted = false;
  double ballX = 135;
  double ballY = 85;
  double initialX = 0;
  double initialY = 0;
  double blockSize = 100;
  double boardSize = 0;
  double ballSize = 0;
  double linearVelocity = 90;
  double velocity = 0.06;
  static int refreshMiliseconds = 20;
  String ballState = "";
  double? radians;
  int initialFlowLength = 0;
  var lastBlock = {"x": 0.0, "y": 0.0};
  String level = "1";
  double volume = 1;

  static var duration = Duration(milliseconds: refreshMiliseconds);
  Timer timer = Timer(duration, () {});
  List<String> flow = [];
  List<int> stageStartPoint = [];

  Map arcMap = Arc.arcMap;

  _initializeBall(InitalizeBall event, Emitter<BallState> emit) {
    var context = event.context;

    var puzzleBloc = context.read<PuzzleBloc>();

    volume = double.parse(SharedPrefUtils.volume) / 100;

    flow = puzzleBloc.flow;
    initialFlowLength = flow.length;
    boardSize = PuzzleBloc.getBoardSize(context);
    blockSize = boardSize / puzzleBloc.numBlocks;
    ballSize = blockSize * 0.28;
    level = puzzleBloc.level;

    if (state is! BallRollComplete) {
      getCoordinates(puzzleBloc.stageStartPoint!);
      emit(BallInitial());
    } else {
      getCoordinates(puzzleBloc.stageEndPoint!);
    }

    ballX = initialX;
    ballY = initialY;
  }

  _ballInitalize(BallInitalize event, Emitter<BallState> emit) {
    emit(BallInitial());
  }

  getCoordinates(StagePoint point) {
    var position = point.position;
    switch (position) {
      case Position.up:
        initialX = blockSize * point.x + blockSize / 2 - ballSize / 2;
        initialY = blockSize * point.y + blockSize * .15;
        break;

      case Position.down:
        initialX = blockSize * point.x + blockSize / 2 - ballSize / 2;
        initialY = blockSize * point.y - ballSize + blockSize * .85;
        break;

      case Position.right:
        initialX = blockSize * point.x - ballSize + blockSize * .85;
        initialY = blockSize * point.y + blockSize / 2 - ballSize / 2;
        break;
      case Position.left:
        initialX = blockSize * point.x + blockSize * .15;
        initialY = blockSize * point.y + blockSize / 2 - ballSize / 2;
        break;
    }
  }

  curveAdjustment(String arc, double x, double y) {
    switch (arc) {
      case "C_UL":
        return {"x": x - blockSize / 2, "y": y};
      case "C_BL":
        return {"x": x - blockSize / 2, "y": y};
      case "C_LB":
        return {"x": x, "y": y + blockSize / 2};
      case "C_LU":
        return {"x": x, "y": y - blockSize / 2};
      case "C_BR":
        return {"x": x + blockSize / 2, "y": y};
      case "C_UR":
        return {"x": x + blockSize / 2, "y": y};
      case "C_RU":
        return {"x": x, "y": y - blockSize / 2};
      case "C_RB":
        return {"x": x, "y": y + blockSize / 2};
      default:
        return {"x": x, "y": y};
    }
  }

  _rollBall(RollBall event, Emitter<BallState> emit) {
    ballState = flow.removeAt(0);
    gameHasStarted = true;
    ballX = initialX;
    ballY = initialY;
    lastBlock["x"] = ballX;
    lastBlock["y"] = ballY;
    timer = Timer.periodic(duration, (timer) {
      add(UpdateBall());
    });
  }

  _updateBall(UpdateBall event, Emitter<BallState> emit) {
    if (state is BallRollComplete) {
      timer.cancel();
      var context = navigatorKey.currentContext!;
      final sound = AudioCache();
      sound.play('audio/missionPassed.mp3', volume: volume);
      WinPopup.show(context, int.parse(level));
    }

    if (ballState == "") {
      emit(BallRollComplete());
      return;
    }

    String motionType = ballState[0];

    if (motionType == "C") {
      add(UpdateCurveState());
    } else if (motionType == "L") {
      add(UpdateLinearState());
    }
  }

  _updateCurveState(UpdateCurveState event, Emitter<BallState> emit) {
    int direction = arcMap[ballState]['direction'];
    String operator = arcMap[ballState]['operator'];
    var end = arcMap[ballState]['end'];

    radians ??= degreeToRadians(arcMap[ballState]['start']);
    radians = radians! + direction * velocity;

    var lastBlockData = curveAdjustment(
      ballState,
      lastBlock["x"] as double,
      lastBlock["y"] as double,
    );

    ballX = lastBlockData["x"] + cos(radians!) * blockSize / 2;
    ballY = lastBlockData["y"] + sin(radians!) * blockSize / 2;

    emit(BallRolling(ballX, ballY, ballSize));

    if (operator == ">") {
      if (radians! < degreeToRadians(end)) {
        lastBlock["x"] = ballX;
        lastBlock["y"] = ballY;
        updateStateAndRadians();
      }
    } else {
      if (radians! > degreeToRadians(end)) {
        lastBlock["x"] = ballX;
        lastBlock["y"] = ballY;
        updateStateAndRadians();
      }
    }
  }

  _updateLinearState(UpdateLinearState event, Emitter<BallState> emit) {
    String st = ballState;
    if (arcMap[st]["end"] == null) {
      if (arcMap[st]["type"] == "V") {
        if (flow.length == initialFlowLength - 1 || flow.isEmpty) {
          if (arcMap[st]["direction"] == -1) {
            arcMap[st]["end"] =
                ballY + arcMap[st]["direction"] * blockSize * 0.70;
          } else {
            arcMap[st]["end"] = ballY +
                arcMap[st]["direction"] * blockSize * 0.85 -
                ballSize / 2;
          }
        } else {
          arcMap[st]["end"] = ballY + arcMap[st]["direction"] * blockSize;
        }
        ballY = ballY + arcMap[st]["direction"] * velocity * linearVelocity;
      } else {
        if (flow.length == initialFlowLength - 1 || flow.isEmpty) {
          if (arcMap[st]["direction"] == -1) {
            arcMap[st]["end"] =
                ballX + arcMap[st]["direction"] * blockSize * 0.70;
          } else {
            arcMap[st]["end"] = ballX +
                arcMap[st]["direction"] * blockSize * 0.85 -
                ballSize / 2;
          }
        } else {
          arcMap[st]["end"] = ballX + arcMap[st]["direction"] * blockSize;
        }

        ballX = ballX + arcMap[st]["direction"] * velocity * linearVelocity;
      }
    }

    if (arcMap[st]["type"] == "V") {
      ballY = ballY + arcMap[st]["direction"] * velocity * linearVelocity;
    } else {
      ballX = ballX + arcMap[st]["direction"] * velocity * linearVelocity;
    }

    if (arcMap[st]["operator"] == ">") {
      if (arcMap[st]["type"] == "V") {
        if (ballY < arcMap[st]["end"]) {
          radians = null;
          arcMap[st]["end"] = null;
          lastBlock["x"] = ballX;
          lastBlock["y"] = ballY;
          if (flow.isNotEmpty) {
            ballState = flow.removeAt(0);
          } else {
            ballState = "";
          }
        }
      } else {
        if (ballX < arcMap[st]["end"]) {
          radians = null;
          arcMap[st]["end"] = null;
          lastBlock["x"] = ballX;
          lastBlock["y"] = ballY;
          if (flow.isNotEmpty) {
            ballState = flow.removeAt(0);
          } else {
            ballState = "";
          }
        }
      }
    } else {
      if (arcMap[st]["type"] == "V") {
        if (ballY > arcMap[st]["end"]) {
          radians = null;
          arcMap[st]["end"] = null;
          lastBlock["x"] = ballX;
          lastBlock["y"] = ballY;
          if (flow.isNotEmpty) {
            ballState = flow.removeAt(0);
          } else {
            ballState = "";
          }
        }
      } else {
        if (ballX > arcMap[st]["end"]) {
          radians = null;
          arcMap[st]["end"] = null;
          lastBlock["x"] = ballX;
          lastBlock["y"] = ballY;
          if (flow.isNotEmpty) {
            ballState = flow.removeAt(0);
          } else {
            ballState = "";
          }
        }
      }
    }

    ballX = ballX;
    ballY = ballY;

    emit(BallRolling(ballX, ballY, ballSize));
  }

  double degreeToRadians(int degrees) {
    return degrees * (pi / 180);
  }

  void updateStateAndRadians() {
    if (flow.isNotEmpty) {
      ballState = flow.removeAt(0);
      var start = arcMap[ballState]['start'];
      if (start != null) {
        radians = degreeToRadians(start);
      }
    } else {
      ballState = "";
    }
  }
}
