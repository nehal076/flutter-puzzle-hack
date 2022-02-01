import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/ball/ball_bloc.dart';

class CoverScreen extends StatelessWidget {
  const CoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BallBloc, BallState>(
      builder: (context, state) {
        return Text(
          context.read<BallBloc>().gameHasStarted
              ? ''
              : 'R O L L  T H E  B A L L',
          style: const TextStyle(
            color: Colors.white,
          ),
        );
      },
    );
  }
}
