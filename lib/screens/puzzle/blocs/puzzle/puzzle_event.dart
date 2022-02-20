part of 'puzzle_bloc.dart';

abstract class PuzzleEvent {
  const PuzzleEvent();
}

class InitPuzzle extends PuzzleEvent {
  final int level;

  InitPuzzle(this.level);
}

class Swipe extends PuzzleEvent {
  final BuildContext context;
  final Direction direction;
  final int row;
  final int column;

  Swipe(this.context, this.direction, this.row, this.column);
}
