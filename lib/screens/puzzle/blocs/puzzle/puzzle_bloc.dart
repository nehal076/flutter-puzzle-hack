import 'package:audioplayers/audioplayers.dart';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/blocs/ball/ball_bloc.dart';

part 'puzzle_event.dart';
part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc() : super(PuzzleInitial()) {
    on<Swipe>(_swipe);
  }

  List<List<int>> playerLevel = [];

  List<List<int>> playerLevelWin = [];

  final sound = AudioCache();

  _swipe(Swipe event, Emitter<PuzzleState> emit) {
    Direction direction = event.direction;
    int i = event.row;
    int j = event.column;

    switch (direction) {
      case Direction.up:
        playerLevel[i - 1][j] = playerLevel[i][j];
        break;
      case Direction.down:
        playerLevel[i + 1][j] = playerLevel[i][j];
        break;
      case Direction.left:
        playerLevel[i][j - 1] = playerLevel[i][j];
        break;
      case Direction.right:
        playerLevel[i][j + 1] = playerLevel[i][j];
        break;
    }

    playerLevel[i][j] = 0;

    sound.play('audio/tile.mp3', volume: 0.5);
    emit(TileMoved());

    if (const DeepCollectionEquality().equals(playerLevel, playerLevelWin)) {
      BlocProvider.of<BallBloc>(event.context).add(RollBall());
    }
  }
}

enum Direction {
  up,
  down,
  left,
  right,
}
