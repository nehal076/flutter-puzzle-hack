part of 'timer_bloc.dart';

abstract class TimerState {
  const TimerState();
}

class TimerInitial extends TimerState {
  const TimerInitial() : super();
}

class TimerRunInProgress extends TimerState {
  final String time;
  const TimerRunInProgress({
    required this.time,
  });
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete();
}

class ResetTimer extends TimerState {
  const ResetTimer();
}
