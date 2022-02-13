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
      position: Position.down,
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
      [0, 21, 0, 0],
    ],
    flow: ["L_DU", "C_BL", "C_RB", "L_UD", "C_UR", "L_LR", "C_LU", "L_DU"],
    stageStartPoint: const StageStartPoint(x: 1, y: 1, position: Position.down),
  ),
];
