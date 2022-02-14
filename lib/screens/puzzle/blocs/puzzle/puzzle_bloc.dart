import 'package:audioplayers/audioplayers.dart';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/blocs/ball/ball_bloc.dart';
import 'package:roll_the_ball/utils/levels_data.dart';
import 'package:roll_the_ball/utils/shared_prefs.dart';

part 'puzzle_event.dart';
part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc() : super(PuzzleInitial()) {
    on<InitPuzzle>(_initPuzzle);
    on<Swipe>(_swipe);
  }

  List<List<int>> initialState = [];
  List<List<int>> winningState = [];
  int numBlocks = 0;
  List<String> flow = [];
  StageStartPoint? stageStartPoint;

  final sound = AudioCache();

  _initPuzzle(InitPuzzle event, Emitter<PuzzleState> emit) {
    String playerLevel =
        SharedPrefUtils.playerLevel == '' ? '1' : SharedPrefUtils.playerLevel;
    // playerLevel = '2';

    Level player = levelData.firstWhere((e) => '${e.levelNum}' == playerLevel);

    initialState = player.initialState;
    winningState = player.winningState;
    numBlocks = player.initialState[0].length;
    stageStartPoint = player.stageStartPoint;
    flow = player.flow;

    emit(PuzzleInitial());
  }

  _swipe(Swipe event, Emitter<PuzzleState> emit) {
    Direction direction = event.direction;
    int i = event.row;
    int j = event.column;

    switch (direction) {
      case Direction.up:
        initialState[i - 1][j] = initialState[i][j];
        break;
      case Direction.down:
        initialState[i + 1][j] = initialState[i][j];
        break;
      case Direction.left:
        initialState[i][j - 1] = initialState[i][j];
        break;
      case Direction.right:
        initialState[i][j + 1] = initialState[i][j];
        break;
    }

    initialState[i][j] = 0;

    sound.play('audio/tile.mp3', volume: 0.5);
    emit(TileMoved());

    if (const DeepCollectionEquality().equals(initialState, winningState)) {
      BlocProvider.of<BallBloc>(event.context).add(RollBall());
    }
  }

  static getBoardSize(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 0.90;
    final double _height = MediaQuery.of(context).size.height * 0.90;

    final double boardSize = _width > _height ? _height : _width;

    return boardSize;
  }

  static double getBallSize(BuildContext context) {
    return 25; //TODO make dynamic later
  }
}

enum Direction {
  up,
  down,
  left,
  right,
}

enum Position {
  up,
  down,
  left,
  right,
}
