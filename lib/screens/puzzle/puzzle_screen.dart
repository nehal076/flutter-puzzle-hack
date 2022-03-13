import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/puzzle/puzzle_bloc.dart';
import 'blocs/timer/timer_bloc.dart';
import 'puzzle_widgets/widgets.dart';

class PuzzleScreen extends StatefulWidget {
  final int level;
  const PuzzleScreen({Key? key, required this.level}) : super(key: key);

  @override
  _PuzzleScreenState createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PuzzleBloc>().add(InitPuzzle(widget.level));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Background(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PuzzleTopView(),
                  Board(
                    child: Stack(
                      children: const [
                        PuzzleView(),
                        BallView(),
                      ],
                    ),
                  ),
                  PuzzleBottomView(level: widget.level),
                ],
              ),
            ),
          ),
          AnimatedTextKit(
            totalRepeatCount: 1,
            onFinished: () {
              BlocProvider.of<TimerBloc>(context).add(TimerStarted());
            },
            pause: const Duration(milliseconds: 4),
            animatedTexts: [
              ScaleAnimatedText(
                'Ready?',
                textStyle: const TextStyle(
                  fontSize: 70.0,
                  color: Colors.white,
                ),
                duration: const Duration(seconds: 1),
              ),
              ScaleAnimatedText(
                'GO!!',
                textStyle: const TextStyle(
                  fontSize: 70.0,
                  color: Colors.white,
                ),
                duration: const Duration(seconds: 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
