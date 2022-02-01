import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:roll_the_ball/utils/arc_map.dart';

part 'ball_event.dart';
part 'ball_state.dart';

class BallBloc extends Bloc<BallEvent, BallState> {
  BallBloc() : super(BallInitial()) {
    on<RollBall>(_rollBall);
    on<UpdateBall>(_updateBall);
    on<UpdateLinearState>(_updateLinearState);
    on<UpdateCurveState>(_updateCurveState);
  }

  bool gameHasStarted = false;
  double ballX = 135;
  double ballY = 85;
  double initialX = 0;
  double initialY = 0;
  double blockSize = 100;
  double linearVelocity = 60;
  int numBlocks = 2;
  int refreshMiliseconds = 40;
  String ballState = "";
  double? radians;
  double velocity = 0.03;
  var lastBlock = {"x": 0.0, "y": 0.0};

  List<String> flow = ["L_UD", "C_UR", "C_LU", "C_BR", "C_LB", "L_UD"];

  Map arcMap = Arc.arcMap;

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
    Timer.periodic(Duration(milliseconds: refreshMiliseconds), (timer) {
      add(UpdateBall());
    });
  }

  _updateBall(UpdateBall event, Emitter<BallState> emit) {
    if (ballState == "") {
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

    emit(BallRolling(ballX, ballY));

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
        arcMap[st]["end"] = ballY + arcMap[st]["direction"] * blockSize;
        ballY = ballY + arcMap[st]["direction"] * velocity * linearVelocity;
      } else {
        arcMap[st]["end"] = ballX + arcMap[st]["direction"] * blockSize;
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

    emit(BallRolling(ballX, ballY));
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
