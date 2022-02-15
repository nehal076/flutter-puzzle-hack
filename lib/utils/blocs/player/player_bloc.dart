import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:roll_the_ball/main.dart';
import 'package:roll_the_ball/screens/puzzle/blocs/puzzle/puzzle_bloc.dart';
import 'package:roll_the_ball/utils/levels_data.dart';
import 'package:roll_the_ball/utils/shared_prefs.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerInitial()) {
    on<PlayerInit>(_playerInit);
  }

  _playerInit(PlayerInit event, Emitter<PlayerState> emit) {
    var context = navigatorKey.currentContext!;
    final puzzleBloc = context.read<PuzzleBloc>();

    String playerLevel =
        SharedPrefUtils.playerLevel == '' ? '1' : SharedPrefUtils.playerLevel;

    Level player = levelData.firstWhere((e) => '${e.levelNum}' == playerLevel);

    puzzleBloc.initialState = player.initialState;
    puzzleBloc.winningState = player.winningState;
    puzzleBloc.numBlocks = player.initialState[0].length;
  }
}
