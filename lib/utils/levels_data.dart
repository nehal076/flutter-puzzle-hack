import 'package:way_for_ball/screens/puzzle/blocs/puzzle/puzzle_bloc.dart';

class Level {
  final int levelNum;
  List<List<int>> initialState;
  final List<List<List<int>>> winningStates;
  final List<List<String>> flows;
  final StagePoint stageStartPoint;
  final StagePoint stageEndPoint;

  Level({
    required this.levelNum,
    required this.initialState,
    required this.winningStates,
    required this.flows,
    required this.stageStartPoint,
    required this.stageEndPoint,
  });
}

class StagePoint {
  final int x;
  final int y;
  final Position position;

  const StagePoint({
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
    winningStates: [
      [
        [0, 0, 0, 0],
        [0, 5, 14, 19],
        [0, 17, 18, 2],
        [0, 0, 0, 0],
      ]
    ],
    flows: [
      ["L_UD", "C_UR", "C_LU", "C_BR", "C_LB", "L_UD"]
    ],
    stageStartPoint: const StagePoint(x: 1, y: 1, position: Position.up),
    stageEndPoint: const StagePoint(x: 3, y: 2, position: Position.down),
  ),
  Level(
    levelNum: 2,
    initialState: [
      [14, 19, 0, 0],
      [15, 6, 1, 0],
      [17, 21, 16, 0],
      [0, 0, 18, 0],
    ],
    winningStates: [
      [
        [14, 19, 0, 0],
        [15, 6, 1, 0],
        [17, 16, 18, 0],
        [0, 0, 0, 0],
      ]
    ],
    flows: [
      ["L_DU", "C_BL", "C_RB", "L_UD", "C_UR", "L_LR", "C_LU", "L_DU"]
    ],
    stageStartPoint: const StagePoint(x: 1, y: 1, position: Position.down),
    stageEndPoint: const StagePoint(x: 2, y: 1, position: Position.up),
  ),
  Level(
    levelNum: 3,
    initialState: [
      [0, 0, 0, 5],
      [0, 14, 18, 21],
      [0, 16, 0, 0],
      [4, 0, 15, 18],
    ],
    winningStates: [
      [
        [0, 0, 0, 5],
        [0, 14, 16, 18],
        [0, 15, 0, 0],
        [4, 18, 0, 0],
      ]
    ],
    flows: [
      ["L_UD", "C_UL", "L_RL", "C_RB", "L_UD", "C_UL", "L_RL"]
    ],
    stageStartPoint: const StagePoint(x: 3, y: 0, position: Position.up),
    stageEndPoint: const StagePoint(x: 0, y: 3, position: Position.left),
  ),
  Level(
    levelNum: 4,
    initialState: [
      [20, 19, 0, 0],
      [15, 6, 1, 0],
      [16, 18, 21, 0],
      [17, 0, 0, 0],
    ],
    winningStates: [
      [
        [20, 19, 0, 0],
        [15, 6, 1, 0],
        [17, 16, 18, 0],
        [0, 0, 0, 0],
      ],
      [
        [0, 20, 16, 19],
        [0, 6, 1, 15],
        [0, 0, 17, 18],
        [0, 0, 0, 0],
      ]
    ],
    flows: [
      ["L_DU", "C_BL", "C_RB", "L_UD", "C_UR", "L_LR", "C_LU", "L_DU"],
      ["L_DU", "C_BR", "L_LR", "C_LB", "L_UD", "C_UL", "C_RU", "L_DU"],
    ],
    stageStartPoint: const StagePoint(x: 1, y: 1, position: Position.down),
    stageEndPoint: const StagePoint(x: 2, y: 1, position: Position.up),
  ),
  Level(
    levelNum: 5,
    initialState: [
      [20, 0, 20, 7],
      [0, 0, 18, 0],
      [15, 3, 0, 15],
      [0, 17, 16, 0],
    ],
    winningStates: [
      [
        [0, 0, 20, 7],
        [20, 16, 18, 0],
        [17, 3, 0, 0],
        [0, 0, 0, 0],
      ],
      [
        [0, 0, 20, 7],
        [0, 0, 15, 0],
        [20, 3, 15, 0],
        [17, 16, 18, 0],
      ],
      [
        [0, 20, 16, 7],
        [20, 18, 0, 0],
        [17, 3, 0, 0],
        [0, 0, 0, 0],
      ]
    ],
    flows: [
      ["L_RL", "C_RB", "C_UL", "L_RL", "C_RB", "C_UR", "L_LR"],
      ["L_RL", "C_RB", "L_UD", "L_UD", "C_UL", "L_RL", "C_RU", "C_BR", "L_LR"],
      ["L_RL", "L_RL", "C_RB", "C_UL", "C_RB", "C_UR", "L_LR"],
    ],
    stageStartPoint: const StagePoint(x: 3, y: 0, position: Position.right),
    stageEndPoint: const StagePoint(x: 1, y: 2, position: Position.right),
  ),
  Level(
    levelNum: 6,
    initialState: [
      [0, 14, 13, 0],
      [0, 15, 15, 0],
      [0, 15, 15, 0],
      [8, 17, 18, 3],
    ],
    winningStates: [
      [
        [0, 14, 13, 0],
        [0, 15, 15, 0],
        [0, 15, 15, 0],
        [8, 18, 17, 3],
      ]
    ],
    flows: [
      [
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
      ]
    ],
    stageStartPoint: const StagePoint(x: 0, y: 3, position: Position.left),
    stageEndPoint: const StagePoint(x: 3, y: 3, position: Position.right),
  ),
  Level(
    levelNum: 7,
    initialState: [
      [0, 0, 0, 0],
      [20, 7, 4, 19],
      [16, 21, 21, 16],
      [0, 17, 18, 0],
    ],
    winningStates: [
      [
        [0, 0, 0, 0],
        [20, 7, 4, 19],
        [17, 16, 16, 18],
        [0, 0, 0, 0],
      ]
    ],
    flows: [
      ["L_RL", "C_RB", "C_UR", "L_LR", "L_LR", "C_LU", "C_BL", "L_RL"]
    ],
    stageStartPoint: const StagePoint(x: 1, y: 1, position: Position.right),
    stageEndPoint: const StagePoint(x: 2, y: 1, position: Position.left),
  ),
  Level(
    levelNum: 8,
    initialState: [
      [17, 0, 0, 20],
      [0, 18, 7, 0],
      [0, 0, 0, 1],
      [15, 16, 0, 0],
    ],
    winningStates: [
      [
        [0, 0, 0, 0],
        [0, 20, 7, 0],
        [0, 15, 0, 1],
        [0, 17, 16, 18],
      ]
    ],
    flows: [
      ["L_RL", "C_RB", "L_UD", "C_UR", "L_LR", "C_LU", "L_DU"]
    ],
    stageStartPoint: const StagePoint(x: 2, y: 1, position: Position.right),
    stageEndPoint: const StagePoint(x: 3, y: 2, position: Position.up),
  ),
  Level(
    levelNum: 9,
    initialState: [
      [5, 14, 16, 19],
      [15, 0, 1, 15],
      [18, 16, 17, 18],
      [17, 0, 0, 0],
    ],
    winningStates: [
      [
        [5, 14, 16, 19],
        [17, 18, 1, 15],
        [0, 0, 17, 18],
        [0, 0, 0, 0],
      ],
      [
        [5, 0, 0, 0],
        [15, 0, 1, 0],
        [17, 16, 18, 0],
        [0, 0, 0, 0],
      ],
      [
        [5, 0, 0, 0],
        [15, 0, 1, 0],
        [15, 0, 17, 19],
        [17, 16, 16, 18],
      ]
    ],
    flows: [
      [
        "L_UD",
        "C_UR",
        "C_LU",
        "C_BR",
        "L_LR",
        "C_LB",
        "L_UD",
        "C_UL",
        "C_RU",
        "L_DU"
      ],
      ["L_UD", "L_UD", "C_UR", "L_LR", "C_LU", "L_DU"],
      [
        "L_UD",
        "L_UD",
        "L_UD",
        "C_UR",
        "L_LR",
        "L_LR",
        "C_LU",
        "C_BL",
        "C_RU",
        "L_DU"
      ]
    ],
    stageStartPoint: const StagePoint(x: 0, y: 0, position: Position.up),
    stageEndPoint: const StagePoint(x: 2, y: 1, position: Position.up),
  ),
  Level(
    levelNum: 10,
    initialState: [
      [0, 0, 0, 0],
      [0, 8, 18, 19],
      [0, 20, 10, 16],
      [0, 17, 3, 0],
    ],
    winningStates: [
      [
        [0, 0, 0, 0],
        [0, 8, 16, 19],
        [0, 20, 10, 18],
        [0, 17, 3, 0],
      ]
    ],
    flows: [
      ["L_LR", "L_LR", "C_LB", "C_UL", "L_RL", "C_RB", "C_UR", "L_LR"]
    ],
    stageStartPoint: const StagePoint(x: 1, y: 1, position: Position.left),
    stageEndPoint: const StagePoint(x: 2, y: 3, position: Position.right),
  ),
  Level(
    levelNum: 11,
    initialState: [
      [0, 0, 0, 0],
      [0, 16, 1, 0],
      [0, 18, 17, 19],
      [8, 20, 16, 18],
    ],
    winningStates: [
      [
        [0, 0, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 17, 19],
        [8, 16, 16, 18],
      ],
      [
        [0, 0, 0, 0],
        [0, 0, 1, 0],
        [0, 20, 18, 0],
        [8, 18, 0, 0],
      ]
    ],
    flows: [
      ["L_LR", "L_LR", "L_LR", "C_LU", "C_BL", "C_RU", "L_DU"],
      ["L_LR", "C_LU", "C_BR", "C_LU", "L_DU"],
    ],
    stageStartPoint: const StagePoint(x: 0, y: 3, position: Position.left),
    stageEndPoint: const StagePoint(x: 2, y: 1, position: Position.up),
  ),
  Level(
    levelNum: 12,
    initialState: [
      [0, 0, 0, 0],
      [0, 21, 15, 0],
      [19, 20, 1, 15],
      [6, 17, 18, 0],
    ],
    winningStates: [
      [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [20, 19, 1, 0],
        [6, 17, 18, 0],
      ],
      [
        [0, 0, 0, 0],
        [20, 19, 0, 0],
        [15, 15, 1, 0],
        [6, 17, 18, 0],
      ]
    ],
    flows: [
      ["L_DU", "C_BR", "C_LB", "C_UR", "C_LU", "L_DU"],
      ["L_DU", "L_DU", "C_BR", "C_LB", "L_UD", "C_UR", "C_LU", "L_DU"],
    ],
    stageStartPoint: const StagePoint(x: 0, y: 3, position: Position.down),
    stageEndPoint: const StagePoint(x: 2, y: 2, position: Position.up),
  ),
];
