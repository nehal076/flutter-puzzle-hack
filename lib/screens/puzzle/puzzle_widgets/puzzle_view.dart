import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/blocs/puzzle/puzzle_bloc.dart';
import 'package:roll_the_ball/widgets/swipe_detector.dart';

class PuzzleView extends StatefulWidget {
  const PuzzleView({Key? key}) : super(key: key);

  @override
  _PuzzleViewState createState() => _PuzzleViewState();
}

class _PuzzleViewState extends State<PuzzleView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleBloc, PuzzleState>(
      builder: (context, state) {
        final puzzleBloc = context.read<PuzzleBloc>();
        List<List<int>> level = puzzleBloc.level1;
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
                        child: Image.asset(
                          'assets/images/tiles/tile${level[i][j]}.png',
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
