import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/blocs/ball/ball_bloc.dart';

import 'ball.dart';

class BallView extends StatefulWidget {
  const BallView({Key? key}) : super(key: key);

  @override
  _BallViewState createState() => _BallViewState();
}

class _BallViewState extends State<BallView> {
  @override
  Widget build(BuildContext context) {
    const int numBlocks = 4; //TODO: Fetch later from stage data
    const int ballSize = 25; //TODO make dynamic later
    final double _width = MediaQuery.of(context).size.width * 0.90;
    final double _height = MediaQuery.of(context).size.height * 0.90;
    List<int> stageStartPoint = [1, 1];
    final double _boardSize = _width > _height ? _height : _width;

    // final size = MediaQuery.of(context).size;
    return BlocBuilder<BallBloc, BallState>(
      builder: (context, state) {
        double _blockSize = _boardSize / numBlocks;
        final ballBloc = context.read<BallBloc>();
        ballBloc.blockSize = _blockSize;

        ballBloc.initialX =
            _blockSize * stageStartPoint[0] + _blockSize / 2 - ballSize / 2;
        ballBloc.initialY = _blockSize * stageStartPoint[1];

        double ballX =
            _blockSize * stageStartPoint[0] + _blockSize / 2 - ballSize / 2;
        double ballY = _blockSize * stageStartPoint[1];

        if (state is BallRolling) {
          ballX = state.ballX;
          ballY = state.ballY;
        }
        return Ball(x: ballX, y: ballY);
      },
    );
  }
}
