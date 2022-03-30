part of 'ball_bloc.dart';

abstract class BallEvent {
  const BallEvent();
}

class InitalizeBall extends BallEvent {
  final BuildContext context;
  InitalizeBall(this.context);
}

class UpdateBall extends BallEvent {}

class UpdateLinearState extends BallEvent {}

class UpdateCurveState extends BallEvent {}

class RollBall extends BallEvent {}

class BallInitalize extends BallEvent {}
