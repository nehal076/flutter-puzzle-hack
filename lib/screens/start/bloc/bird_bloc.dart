import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

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
    double width = MediaQuery.of(event.context).size.width;
    y = width * 0.15;

    Timer.periodic(const Duration(milliseconds: 20), (_) {
      if (x > width) {
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
