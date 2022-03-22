part of 'bird_bloc.dart';

abstract class BirdEvent {}

class InitializeBird extends BirdEvent {
  final BuildContext context;

  InitializeBird(this.context);
}

class MoveBird extends BirdEvent {}
