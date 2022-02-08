import 'package:flutter/material.dart';
import 'package:roll_the_ball/screens/puzzle/puzzle_widgets/background.dart';
import 'package:roll_the_ball/screens/puzzle/puzzle_widgets/ball_view.dart';
import 'package:roll_the_ball/screens/puzzle/puzzle_widgets/board.dart';
import 'package:roll_the_ball/screens/puzzle/puzzle_widgets/puzzle_view.dart';

class PuzzleScreen extends StatefulWidget {
  final int level;
  const PuzzleScreen({Key? key, required this.level}) : super(key: key);

  @override
  _PuzzleScreenState createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Board(
        child: Stack(
          children: const [
            PuzzleView(),
            BallView(),
          ],
        ),
      ),
    );
  }
}
