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
    // final size = MediaQuery.of(context).size;
    return BlocBuilder<BallBloc, BallState>(
      builder: (context, state) {
        print(state);
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
    );
  }
}
