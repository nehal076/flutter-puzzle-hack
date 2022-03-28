import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way_for_ball/screens/puzzle/blocs/ball/ball_bloc.dart';
import 'ball.dart';

class BallView extends StatefulWidget {
  const BallView({Key? key}) : super(key: key);

  @override
  _BallViewState createState() => _BallViewState();
}

class _BallViewState extends State<BallView> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BallBloc>(context).add(InitalizeBall(context));
    return BlocBuilder<BallBloc, BallState>(
      builder: (context, state) {
        final ballBloc = context.read<BallBloc>();
        double ballX = ballBloc.ballX;
        double ballY = ballBloc.ballY;
        double ballSize = ballBloc.ballSize;
        if (state is BallRolling) {
          ballX = state.ballX;
          ballY = state.ballY;
        }

        // else {
        //   BlocProvider.of<BallBloc>(context).add(InitalizeBall(context));
        // }
        return Ball(x: ballX, y: ballY, ballSize: ballSize);
      },
    );
  }
}
