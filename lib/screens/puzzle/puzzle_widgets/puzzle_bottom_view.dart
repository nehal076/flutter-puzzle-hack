import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/blocs/ball/ball_bloc.dart';
import '../blocs/puzzle/puzzle_bloc.dart';

class PuzzleBottomView extends StatefulWidget {
  const PuzzleBottomView({Key? key}) : super(key: key);

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
            GameButton("20", "Back", onTap: () {
              Navigator.of(context).pop();
            }),
            GameButton("18", "Restart", onTap: () {
              context.read<PuzzleBloc>().add(InitPuzzle());
              context.read<BallBloc>().add(InitalizeBall(context));
            }),
          ],
        ));
  }
}

class GameButton extends StatelessWidget {
  final String number;
  final String text;
  final VoidCallback onTap;
  const GameButton(
    this.number,
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
            Image.asset('assets/images/buttons/tile0$number.png'),
            Material(
              color: Colors.transparent,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xffFFF99E),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
