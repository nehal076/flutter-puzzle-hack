import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way_for_ball/utils/shared_prefs.dart';
part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static var duration = const Duration(seconds: 1);
  Timer timer = Timer(duration, () {});
  int playTime = 0;
  String time = "";

  TimerBloc() : super(const TimerInitial()) {
    on<TimerStarted>(_onStarted);
    on<TimerReset>(_onReset);
    on<TimerTicked>(_onTicked);
    on<TimerStop>(_onStop);
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    add(TimerTicked());
    playTime = 0;
    timer = Timer.periodic(duration, (_) {
      playTime = playTime + 1;
      add(TimerTicked());
    });
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    var dataMap = {
      "moves": event.moveCounter,
      "time": time,
    };

    String data = jsonEncode(dataMap);

    SharedPrefUtils.setUserStringValue(
        "level${SharedPrefUtils.playerLevel}", data);

    timer.cancel();

    emit(const TimerInitial());
  }

  _onStop(TimerStop event, Emitter<TimerState> emit) {
    timer.cancel();

    emit(const ResetTimer());
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    // int hours = playTime ~/ (60 * 60) % 24;
    int minutes = (playTime ~/ 60) % 60;
    int seconds = playTime % 60;

    // String strHours = hours == 0 ? '' : '${format(hours)}:';
    String strHours = '';
    String strMinutes = format(minutes);
    String strSeconds = format(seconds);

    time = "$strHours$strMinutes:$strSeconds";

    emit(TimerRunInProgress(time: time));
  }

  static format(int str) {
    return str.toString().padLeft(2, '0');
  }
}
