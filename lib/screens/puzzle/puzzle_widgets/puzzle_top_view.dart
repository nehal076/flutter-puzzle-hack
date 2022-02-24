import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/blocs/timer/timer_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class PuzzleTopView extends StatefulWidget {
  const PuzzleTopView({Key? key}) : super(key: key);

  @override
  _PuzzleTopViewState createState() => _PuzzleTopViewState();
}

class _PuzzleTopViewState extends State<PuzzleTopView> {
  String time = '--';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        if (state is TimerRunInProgress) {
          time = state.time;
        }

        if (state is ResetTimer) {
          time = '00:00';
        }

        return Text(
          time,
          style: const TextStyle(
            color: Colors.yellowAccent,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        );
      },
    ).py12();
  }
}
