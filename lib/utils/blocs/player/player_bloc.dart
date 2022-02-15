import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerInitial()) {
    on<PlayerInit>(_playerInit);
  }

  _playerInit(PlayerInit event, Emitter<PlayerState> emit) {}
}
