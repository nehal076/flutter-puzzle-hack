import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_the_ball/screens/cover_screen.dart';
import 'package:roll_the_ball/screens/puzzle/bloc/puzzle_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/puzzle_widgets/ball.dart';
import 'package:roll_the_ball/widgets/swipe_detector.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  bool gameHasStarted = false;
  double ballX = 135;
  double ballY = 85;
  double initialX = 0;
  double initialY = 0;
  double blockSize = 100;
  double linearVelocity = 60;
  int numBlocks = 2;
  int refreshMiliseconds = 40;
  String state = "";
  var radians = null;
  double velocity = 0.03;
  var lastBlock = {"x": 0.0, "y": 0.0};

  Map<String, dynamic> arcMap = {
    "C_LU": {"direction": -1, "start": 90, "end": 0, "operator": ">"},
    "C_RU": {"direction": 1, "start": 90, "end": 180, "operator": "<"},
    "C_RB": {"direction": -1, "start": 270, "end": 180, "operator": ">"},
    "C_UL": {"direction": 1, "start": 0, "end": 90, "operator": "<"},
    "C_BL": {"direction": -1, "start": 0, "end": -90, "operator": ">"},
    "C_UR": {"direction": -1, "start": 180, "end": 90, "operator": ">"},
    "C_BR": {"direction": 1, "start": 180, "end": 270, "operator": "<"},
    "C_LB": {"direction": 1, "start": 270, "end": 360, "operator": "<"},
    "L_LR": {"direction": 1, "type": "H", "end": null, "operator": "<"},
    "L_RL": {"direction": -1, "type": "H", "end": null, "operator": ">"},
    "L_UD": {"direction": 1, "type": "V", "end": null, "operator": "<"},
    "L_DU": {"direction": -1, "type": "V", "end": null, "operator": ">"},
  };

  List<String> flow = ["L_UD", "C_UR", "C_LU", "C_BR", "C_LB", "L_UD"];

  curveAdjustment(String arc, double x, double y) {
    switch (arc) {
      case "C_UL":
        {
          return {"x": x - blockSize / 2, "y": y};
        }
      case "C_BL":
        {
          return {"x": x - blockSize / 2, "y": y};
        }
      case "C_LB":
        {
          return {"x": x, "y": y + blockSize / 2};
        }
      case "C_LU":
        {
          return {"x": x, "y": y - blockSize / 2};
        }
      case "C_BR":
        {
          return {"x": x + blockSize / 2, "y": y};
        }
      case "C_UR":
        {
          return {"x": x + blockSize / 2, "y": y};
        }
      case "C_RU":
        {
          return {"x": x, "y": y - blockSize / 2};
        }
      case "C_RB":
        {
          return {"x": x, "y": y + blockSize / 2};
        }
      default:
        {
          return {"x": x, "y": y};
        }
    }
  }

  void startGame() {
    state = flow.removeAt(0);
    gameHasStarted = true;
    ballX = initialX;
    ballY = initialY;
    lastBlock["x"] = ballX;
    lastBlock["y"] = ballY;
    Timer.periodic(Duration(milliseconds: refreshMiliseconds), (timer) {
      update();
    });
  }

  double degreeToRadians(int degrees) {
    return degrees * (pi / 180);
  }

  void updateStateAndRadians() {
    if (flow.isNotEmpty) {
      state = flow.removeAt(0);
      var start = arcMap[state]['start'];
      if (start != null) {
        radians = degreeToRadians(start);
      }
    } else {
      state = "";
    }
  }

  void updateLinearState(String st) {
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
            state = flow.removeAt(0);
          } else {
            state = "";
          }
        }
      } else {
        if (ballX < arcMap[st]["end"]) {
          radians = null;
          arcMap[st]["end"] = null;
          lastBlock["x"] = ballX;
          lastBlock["y"] = ballY;
          if (flow.isNotEmpty) {
            state = flow.removeAt(0);
          } else {
            state = "";
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
            state = flow.removeAt(0);
          } else {
            state = "";
          }
        }
      } else {
        if (ballX > arcMap[st]["end"]) {
          radians = null;
          arcMap[st]["end"] = null;
          lastBlock["x"] = ballX;
          lastBlock["y"] = ballY;
          if (flow.isNotEmpty) {
            state = flow.removeAt(0);
          } else {
            state = "";
          }
        }
      }
    }

    setState(() {
      ballX = ballX;
      ballY = ballY;
    });
  }

  void update() {
    if (state == "") {
      return;
    }

    int direction = arcMap[state]['direction'];
    String operator = arcMap[state]['operator'];
    var end = arcMap[state]['end'];

    String motionType = state[0];

    if (motionType == "C") {
      radians ??= degreeToRadians(arcMap[state]['start']);
      radians = radians + direction * velocity;

      var lastBlockData = curveAdjustment(
          state, lastBlock["x"] as double, lastBlock["y"] as double);

      setState(() {
        ballX = lastBlockData["x"] + cos(radians) * blockSize / 2;
        ballY = lastBlockData["y"] + sin(radians) * blockSize / 2;
      });

      if (operator == ">") {
        if (radians < degreeToRadians(end)) {
          lastBlock["x"] = ballX;
          lastBlock["y"] = ballY;
          updateStateAndRadians();
        }
      } else {
        if (radians > degreeToRadians(end)) {
          lastBlock["x"] = ballX;
          lastBlock["y"] = ballY;
          updateStateAndRadians();
        }
      }
    } else if (motionType == "L") {
      updateLinearState(state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleBloc, PuzzleState>(
      builder: (context, state) {
        List<List<int>> level = context.read<PuzzleBloc>().level1;
        // final size = MediaQuery.of(context).size;
        // blockSize = size.width / numBlocks;
        blockSize = 98;
        initialX = 135;
        initialY = 85;
        // initialX = size.width / 2;
        // initialY = size.height / 2;
        return GestureDetector(
            onTap: startGame,
            child: Stack(
              children: [
                Column(
                  children: [
                    for (var i = 0; i < level.length; i++)
                      Row(
                        children: [
                          for (var j = 0; j < level[i].length; j++)
                            SwipeDetector(
                              onSwipeUp: () {
                                context.read<PuzzleBloc>().add(
                                      Swipe(Direction.up, i, j),
                                    );
                              },
                              onSwipeRight: () {
                                context.read<PuzzleBloc>().add(
                                      Swipe(Direction.right, i, j),
                                    );
                              },
                              onSwipeDown: () {
                                context.read<PuzzleBloc>().add(
                                      Swipe(Direction.down, i, j),
                                    );
                              },
                              onSwipeLeft: () {
                                context.read<PuzzleBloc>().add(
                                      Swipe(Direction.left, i, j),
                                    );
                              },
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Image.asset(
                                    'assets/images/tiles/tile${level[i][j]}.png',
                                  ),
                                  level[i][j] != 0 && level[i][j] == 5
                                      ? Positioned(
                                          top: 13,
                                          child: Image.asset(
                                            'assets/images/ball.png',
                                          ),
                                        )
                                      : Container()
                                ],
                              ),
                            )
                        ],
                      )
                  ],
                ),
                Ball(x: ballX, y: ballY),
                CoverScreen(
                  gameHasStarted: gameHasStarted,
                ),
              ],
            ));
      },
    );
  }
}
