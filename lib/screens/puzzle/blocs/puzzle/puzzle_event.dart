part of 'puzzle_bloc.dart';

abstract class PuzzleEvent {
  const PuzzleEvent();
}

class Swipe extends PuzzleEvent {
  final Direction direction;
  final int row;
  final int column;

  Swipe(this.direction, this.row, this.column);
}
