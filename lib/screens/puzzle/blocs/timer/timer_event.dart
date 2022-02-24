part of 'timer_bloc.dart';

abstract class TimerEvent {
  const TimerEvent();
}

class TimerStarted extends TimerEvent {}

class TimerReset extends TimerEvent {
  final int moveCounter;

  const TimerReset({required this.moveCounter});
}

class TimerStop extends TimerEvent {}

class TimerTicked extends TimerEvent {}
