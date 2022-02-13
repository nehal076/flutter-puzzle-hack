part of 'player_bloc.dart';

@immutable
abstract class PlayerEvent {}

class PlayerInit extends PlayerEvent {}

class PlayerPlay extends PlayerEvent {}

class PlayerPause extends PlayerEvent {}

class PlayerWin extends PlayerEvent {}
