part of 'ball_bloc.dart';

abstract class BallState {
  const BallState();
}

class BallInitial extends BallState {}

class BallRolling extends BallState {
  final double ballX;
  final double ballY;
  final double ballSize;
  BallRolling(this.ballX, this.ballY, this.ballSize);
}

class BallRollComplete extends BallState {}
