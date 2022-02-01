part of 'ball_bloc.dart';

abstract class BallState {
  const BallState();
}

class BallInitial extends BallState {}

class BallRolling extends BallState {
  final double ballX;
  final double ballY;

  BallRolling(this.ballX, this.ballY);
}
