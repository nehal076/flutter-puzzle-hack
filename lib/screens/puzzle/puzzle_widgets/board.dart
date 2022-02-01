import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_the_ball/screens/cover_screen.dart';
import 'package:roll_the_ball/screens/puzzle/blocs/ball/ball_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/blocs/puzzle/puzzle_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/puzzle_widgets/ball.dart';
import 'package:roll_the_ball/widgets/swipe_detector.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<BallBloc>(context).add(RollBall());
      },
      child: Stack(
        children: [
          BlocBuilder<PuzzleBloc, PuzzleState>(
            builder: (context, state) {
              final puzzleBloc = context.read<PuzzleBloc>();
              List<List<int>> level = puzzleBloc.level1;
              return Column(children: [
                for (var i = 0; i < level.length; i++)
                  Row(children: [
                    for (var j = 0; j < level[i].length; j++)
                      SwipeDetector(
                        onSwipeUp: () {
                          puzzleBloc.add(Swipe(Direction.up, i, j));
                        },
                        onSwipeRight: () {
                          puzzleBloc.add(Swipe(Direction.right, i, j));
                        },
                        onSwipeDown: () {
                          puzzleBloc.add(Swipe(Direction.down, i, j));
                        },
                        onSwipeLeft: () {
                          puzzleBloc.add(Swipe(Direction.left, i, j));
                        },
                        child: Image.asset(
                          'assets/images/tiles/tile${level[i][j]}.png',
                        ),
                      )
                  ])
              ]);
            },
          ),
          BlocBuilder<BallBloc, BallState>(
            builder: (context, state) {
              final ballBloc = context.read<BallBloc>();
              // final size = MediaQuery.of(context).size;
              // blockSize = size.width / numBlocks;

              // initialX = size.width / 2;
              // initialY = size.height / 2;

              ballBloc.blockSize = 98;
              ballBloc.initialX = 135;
              ballBloc.initialY = 85;

              double ballX = 135;
              double ballY = 85;

              if (state is BallRolling) {
                ballX = state.ballX;
                ballY = state.ballY;
              }
              return Ball(x: ballX, y: ballY);
            },
          ),
          BlocBuilder<BallBloc, BallState>(
            builder: (context, state) {
              return CoverScreen(
                gameHasStarted: context.watch<BallBloc>().gameHasStarted,
              );
            },
          ),
        ],
      ),
    );
  }
}
