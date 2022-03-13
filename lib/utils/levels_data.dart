import 'package:roll_the_ball/screens/puzzle/blocs/puzzle/puzzle_bloc.dart';

class Level {
  final int levelNum;
  List<List<int>> initialState;
  final List<List<int>> winningState;
  final List<String> flow;
  final StageStartPoint stageStartPoint;

  Level({
    required this.levelNum,
    required this.initialState,
    required this.winningState,
    required this.flow,
    required this.stageStartPoint,
  });
}

class StageStartPoint {
  final int x;
  final int y;
  final Position position;

  const StageStartPoint({
    required this.x,
    required this.y,
    required this.position,
  });
}

List<Level> levelData = [
  Level(
    levelNum: 1,
    initialState: [
      [0, 0, 0, 0],
      [0, 5, 14, 19],
      [0, 17, 0, 2],
      [0, 0, 18, 0],
    ],
    winningState: [
      [0, 0, 0, 0],
      [0, 5, 14, 19],
      [0, 17, 18, 2],
      [0, 0, 0, 0],
    ],
    flow: ["L_UD", "C_UR", "C_LU", "C_BR", "C_LB", "L_UD"],
    stageStartPoint: const StageStartPoint(
      x: 1,
      y: 1,
      position: Position.up,
    ),
  ),
  Level(
    levelNum: 2,
    initialState: [
      [14, 19, 0, 0],
      [15, 6, 1, 0],
      [17, 21, 16, 0],
      [0, 0, 18, 0],
    ],
    winningState: [
      [14, 19, 0, 0],
      [15, 6, 1, 0],
      [17, 16, 18, 0],
      [0, 0, 0, 0],
    ],
    flow: ["L_DU", "C_BL", "C_RB", "L_UD", "C_UR", "L_LR", "C_LU", "L_DU"],
    stageStartPoint: const StageStartPoint(x: 1, y: 1, position: Position.down),
  ),
  Level(
    levelNum: 3,
    initialState: [
      [0, 0, 0, 5],
      [0, 14, 18, 21],
      [0, 16, 0, 0],
      [4, 0, 15, 18],
    ],
    winningState: [
      [0, 0, 0, 5],
      [0, 14, 16, 18],
      [0, 15, 0, 0],
      [4, 18, 0, 0],
    ],
    flow: ["L_UD", "C_UL", "L_RL", "C_RB", "L_UD", "C_UL", "L_RL"],
    stageStartPoint: const StageStartPoint(x: 3, y: 0, position: Position.up),
  ),
  Level(
    levelNum: 4,
    initialState: [
      [20, 19, 0, 0],
      [15, 6, 1, 0],
      [16, 18, 21, 0],
      [17, 0, 0, 0],
    ],
    winningState: [
      [20, 19, 0, 0],
      [15, 6, 1, 0],
      [17, 16, 18, 0],
      [0, 0, 0, 0],
    ],
    flow: ["L_DU", "C_BL", "C_RB", "L_UD", "C_UR", "L_LR", "C_LU", "L_DU"],
    stageStartPoint: const StageStartPoint(x: 1, y: 1, position: Position.down),
  ),
  Level(
    levelNum: 5,
    initialState: [
      [20, 0, 20, 7],
      [0, 0, 18, 0],
      [15, 3, 0, 15],
      [0, 17, 16, 0],
    ],
    winningState: [
      [0, 0, 20, 7],
      [20, 16, 18, 0],
      [17, 3, 0, 0],
      [0, 0, 0, 0],
    ],
    flow: ["L_RL", "C_RB", "C_UL", "L_RL", "C_RB", "C_UR", "L_LR"],
    stageStartPoint:
        const StageStartPoint(x: 3, y: 0, position: Position.right),
  ),
  Level(
    levelNum: 6,
    initialState: [
      [0, 14, 13, 0],
      [0, 15, 15, 0],
      [0, 15, 15, 0],
      [8, 17, 18, 3],
    ],
    winningState: [
      [0, 14, 13, 0],
      [0, 15, 15, 0],
      [0, 15, 15, 0],
      [8, 18, 17, 3],
    ],
    flow: [
      "L_LR",
      "C_LU",
      "L_DU",
      "L_DU",
      "C_BR",
      "C_LB",
      "L_UD",
      "L_UD",
      "C_UR",
      "L_LR"
    ],
    stageStartPoint: const StageStartPoint(x: 0, y: 3, position: Position.left),
  ),
  Level(
    levelNum: 7,
    initialState: [
      [0, 0, 0, 0],
      [20, 7, 4, 19],
      [16, 21, 21, 16],
      [0, 17, 18, 0],
    ],
    winningState: [
      [0, 0, 0, 0],
      [20, 7, 4, 19],
      [17, 16, 16, 18],
      [0, 0, 0, 0],
    ],
    flow: ["L_RL", "C_RB", "C_UR", "L_LR", "L_LR", "C_LU", "C_BL", "L_RL"],
    stageStartPoint:
        const StageStartPoint(x: 1, y: 1, position: Position.right),
  ),
  Level(
    levelNum: 8,
    initialState: [
      [17, 0, 0, 20],
      [0, 18, 7, 0],
      [0, 0, 0, 1],
      [15, 16, 0, 0],
    ],
    winningState: [
      [0, 0, 0, 0],
      [0, 20, 7, 0],
      [0, 15, 0, 1],
      [0, 17, 16, 18],
    ],
    flow: ["L_RL", "C_RB", "L_UD", "C_UR", "L_LR", "C_LU", "L_DU"],
    stageStartPoint:
        const StageStartPoint(x: 2, y: 1, position: Position.right),
  ),
];
