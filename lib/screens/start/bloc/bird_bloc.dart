import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

part 'bird_event.dart';
part 'bird_state.dart';

class BirdBloc extends Bloc<BirdEvent, BirdState> {
  BirdBloc() : super(BirdInitial()) {
    on<InitializeBird>(_initializeBird);
    on<MoveBird>(_moveBird);
  }

  double x = 0;
  double y = 0;

  _initializeBird(InitializeBird event, Emitter<BirdState> emit) {
    y = event.context.screenWidth * 0.15;

    Timer.periodic(const Duration(milliseconds: 40), (_) {
      if (x > event.context.screenWidth) {
        x = 0;
      } else {
        x += 4;
      }

      add(MoveBird());
    });
  }

  _moveBird(MoveBird event, Emitter<BirdState> emit) {
    emit(BirdMoving(x: x, y: y));
  }
}
