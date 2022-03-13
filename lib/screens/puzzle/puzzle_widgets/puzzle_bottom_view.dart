import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roll_the_ball/screens/puzzle/blocs/ball/ball_bloc.dart';
import '../blocs/puzzle/puzzle_bloc.dart';
import '../blocs/timer/timer_bloc.dart';

class PuzzleBottomView extends StatefulWidget {
  final int level;
  const PuzzleBottomView({
    Key? key,
    required this.level,
  }) : super(key: key);

  @override
  _PuzzleBottomViewState createState() => _PuzzleBottomViewState();
}

class _PuzzleBottomViewState extends State<PuzzleBottomView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GameButton("assets/images/back", "Back", onTap: () {
            Navigator.of(context).pop();
          }),
          GameButton("assets/images/restart", "Restart", onTap: () {
            context.read<PuzzleBloc>().add(InitPuzzle(widget.level));
            context.read<BallBloc>().add(InitalizeBall(context));
            context.read<TimerBloc>().add(TimerStop());
            context.read<TimerBloc>().add(TimerStarted());
          }),
        ],
      ),
    );
  }
}

class GameButton extends StatelessWidget {
  final String name;
  final String text;
  final VoidCallback onTap;
  const GameButton(
    this.name,
    this.text, {
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.04,
              child: SvgPicture.asset('$name.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
