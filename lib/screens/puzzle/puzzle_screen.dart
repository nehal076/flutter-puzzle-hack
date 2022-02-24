import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/puzzle/puzzle_bloc.dart';
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
      body: Background(
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
    );
  }
}
