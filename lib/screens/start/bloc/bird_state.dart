part of 'bird_bloc.dart';

abstract class BirdState {}

class BirdInitial extends BirdState {}

class BirdMoving extends BirdState {
  final double x;
  final double y;

  BirdMoving({
    required this.x,
    required this.y,
  });
}
