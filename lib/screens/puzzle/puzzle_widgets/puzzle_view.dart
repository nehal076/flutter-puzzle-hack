import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:way_for_ball/screens/puzzle/blocs/puzzle/puzzle_bloc.dart';
import 'package:way_for_ball/widgets/slide_animation.dart';
import 'package:way_for_ball/widgets/swipe_detector.dart';

class PuzzleView extends StatefulWidget {
  const PuzzleView({
    Key? key,
  }) : super(key: key);

  @override
  _PuzzleViewState createState() => _PuzzleViewState();
}

class _PuzzleViewState extends State<PuzzleView> {
  List<List<int>> level = [];

  int levelLength = 0;
  late PuzzleBloc puzzleBloc;

  @override
  void initState() {
    super.initState();

    puzzleBloc = context.read<PuzzleBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final double _boardSize = PuzzleBloc.getBoardSize(context);
    return BlocBuilder<PuzzleBloc, PuzzleState>(
      builder: (context, state) {
        if (state is PuzzleInitial) {
          level = puzzleBloc.playingState;
          levelLength = level.length;
        }

        return level.isEmpty
            ? const SizedBox()
            : GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: levelLength,
                ),
                itemCount: levelLength * levelLength,
                itemBuilder: (context, index) {
                  int i, j = 0;
                  i = (index / levelLength).floor();
                  j = (index % levelLength);
                  return SwipeDetector(
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
                    child: SlidingAnimation(
                      index: j,
                      child: SizedBox(
                        width: _boardSize / puzzleBloc.numBlocks,
                        height: _boardSize / puzzleBloc.numBlocks,
                        child: SvgPicture.asset(
                          'assets/images/tiles/tile${level[i][j]}.svg',
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
