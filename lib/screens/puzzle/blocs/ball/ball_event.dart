part of 'ball_bloc.dart';

abstract class BallEvent {
  const BallEvent();
}

class UpdateBall extends BallEvent {}

class UpdateLinearState extends BallEvent {}

class UpdateCurveState extends BallEvent {}

class RollBall extends BallEvent {}
