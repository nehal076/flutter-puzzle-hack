import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/bloc/puzzle_bloc.dart';
import 'package:roll_the_ball/widgets/swipe_detector.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleBloc, PuzzleState>(
      builder: (context, state) {
        List<List<int>> level = context.read<PuzzleBloc>().level1;
        return Column(
          children: [
            for (var i = 0; i < level.length; i++)
              Row(
                children: [
                  for (var j = 0; j < level[i].length; j++)
                    SwipeDetector(
                      onSwipeUp: () {
                        context.read<PuzzleBloc>().add(
                              Swipe(Direction.up, i, j),
                            );
                      },
                      onSwipeRight: () {
                        context.read<PuzzleBloc>().add(
                              Swipe(Direction.right, i, j),
                            );
                      },
                      onSwipeDown: () {
                        context.read<PuzzleBloc>().add(
                              Swipe(Direction.down, i, j),
                            );
                      },
                      onSwipeLeft: () {
                        context.read<PuzzleBloc>().add(
                              Swipe(Direction.left, i, j),
                            );
                      },
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(
                            'assets/images/tiles/tile${level[i][j]}.png',
                          ),
                          level[i][j] != 0 && level[i][j] == 5
                              ? Positioned(
                                  top: 13,
                                  child: Image.asset(
                                    'assets/images/ball.png',
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    )
                ],
              )
          ],
        );
      },
    );
  }
}
