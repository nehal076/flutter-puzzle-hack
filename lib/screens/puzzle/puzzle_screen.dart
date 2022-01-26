import 'package:flutter/material.dart';
import 'package:roll_the_ball/screens/puzzle/puzzle_widgets/board.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/board.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Board(),
            ),
          ],
        ),
      ),
    );
  }
}
