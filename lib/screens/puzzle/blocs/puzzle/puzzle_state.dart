part of 'puzzle_bloc.dart';

abstract class PuzzleState {
  const PuzzleState();
}

class PuzzleInitial extends PuzzleState {}

class TileMoved extends PuzzleState {}
