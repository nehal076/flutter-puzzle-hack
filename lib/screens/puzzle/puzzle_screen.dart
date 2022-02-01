import 'package:flutter/material.dart';
import 'package:roll_the_ball/screens/puzzle/puzzle_widgets/ball_view.dart';
import 'package:roll_the_ball/screens/puzzle/puzzle_widgets/board.dart';
import 'package:roll_the_ball/screens/puzzle/puzzle_widgets/puzzle_view.dart';

import 'puzzle_widgets/cover_screen.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({Key? key}) : super(key: key);

  @override
  _PuzzleScreenState createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wood.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Board(
          child: Stack(
            children: const [
              PuzzleView(),
              BallView(),
              CoverScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
