import 'package:audioplayers/audioplayers.dart';

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
  List<List<int>> playingState = [];
  List<List<int>> winningState = [];
  int numBlocks = 0;
  List<String> flow = [];
  StageStartPoint? stageStartPoint;

  final sound = AudioCache();

  _initPuzzle(InitPuzzle event, Emitter<PuzzleState> emit) {
    String playerLevel =
        SharedPrefUtils.playerLevel == '' ? '1' : SharedPrefUtils.playerLevel;

    Level player = levelData.firstWhere((e) => '${e.levelNum}' == playerLevel);

    List<List<int>> arr = [];

    for (var i = 0; i < player.initialState.length; i++) {
      List<int> temp = [];

      for (var j = 0; j < player.initialState[i].length; j++) {
        temp.add(player.initialState[i][j]);
      }

      arr.add(temp);
    }

    initialState = [...player.initialState];
    playingState = arr;
    winningState = player.winningState;
    numBlocks = player.initialState[0].length;
    stageStartPoint = player.stageStartPoint;
    flow = [...player.flow];

    emit(PuzzleInitial());
  }

  _swipe(Swipe event, Emitter<PuzzleState> emit) {
    Direction direction = event.direction;
    int i = event.row;
    int j = event.column;
    if (!(playingState[i][j] > 14)) {
      sound.play('audio/immutableTile.mp3', volume: 0.5);
      return false;
    }

    switch (direction) {
      case Direction.up:
        playingState[i - 1][j] = playingState[i][j];
        break;
      case Direction.down:
        playingState[i + 1][j] = playingState[i][j];
        break;
      case Direction.left:
        playingState[i][j - 1] = playingState[i][j];
        break;
      case Direction.right:
        playingState[i][j + 1] = playingState[i][j];
        break;
    }

    playingState[i][j] = 0;

    sound.play('audio/ballTap.mp3', volume: 0.5);
    emit(TileMoved());

    if (checkWin()) {
      BlocProvider.of<BallBloc>(event.context).add(RollBall());
    }
  }

  checkWin() {
    for (int i = 0; i < playingState.length; i++) {
      for (int j = 0; j < playingState[i].length; j++) {
        if (winningState[i][j] != 0 &&
            playingState[i][j] != winningState[i][j]) {
          return false;
        }
      }
    }
    return true;
  }

  static getBoardSize(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 0.90;
    final double _height = MediaQuery.of(context).size.height * 0.90;

    final double boardSize = _width > _height ? _height : _width;

    return boardSize;
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
