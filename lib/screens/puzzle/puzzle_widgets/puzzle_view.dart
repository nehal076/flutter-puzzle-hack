import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/blocs/puzzle/puzzle_bloc.dart';
import 'package:roll_the_ball/utils/levels_data.dart';
import 'package:roll_the_ball/utils/shared_prefs.dart';
import 'package:roll_the_ball/widgets/swipe_detector.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PuzzleView extends StatefulWidget {
  const PuzzleView({Key? key}) : super(key: key);

  @override
  _PuzzleViewState createState() => _PuzzleViewState();
}

class _PuzzleViewState extends State<PuzzleView> {
  @override
  Widget build(BuildContext context) {
    const int _numBlocks = 4; //TODO: Get this from stage data
    final double _width = MediaQuery.of(context).size.width * 0.90;
    final double _height = MediaQuery.of(context).size.height * 0.90;

    final double _boardSize = _width > _height ? _height : _width;
    return BlocBuilder<PuzzleBloc, PuzzleState>(
      builder: (context, state) {
        final puzzleBloc = context.read<PuzzleBloc>();

        String playerLevel = SharedPrefUtils.playerLevel == ''
            ? '1'
            : SharedPrefUtils.playerLevel;
        playerLevel = '2';

        Level player =
            levelData.firstWhere((e) => '${e.levelNum}' == playerLevel);

        puzzleBloc.playerLevel = player.initialState;
        puzzleBloc.playerLevelWin = player.winningState;

        List<List<int>> level = puzzleBloc.playerLevel;
        return IntrinsicWidth(
          child: Column(
            children: [
              for (var i = 0; i < level.length; i++)
                Row(
                  children: [
                    for (var j = 0; j < level[i].length; j++)
                      SwipeDetector(
                        onSwipeUp: () {
                          puzzleBloc.add(Swipe(context, Direction.up, i, j));
                        },
                        onSwipeRight: () {
                          puzzleBloc.add(Swipe(context, Direction.right, i, j));
                        },
                        onSwipeDown: () {
                          puzzleBloc.add(Swipe(context, Direction.down, i, j));
                        },
                        onSwipeLeft: () {
                          puzzleBloc.add(Swipe(context, Direction.left, i, j));
                        },
                        child: SizedBox(
                          width: _boardSize / _numBlocks,
                          height: _boardSize / _numBlocks,
                          child: SvgPicture.asset(
                            'assets/images/tiles/tile${level[i][j]}.svg',
                          ),
                        ),
                      )
                  ],
                )
            ],
          ),
        );
      },
    );
  }
}
