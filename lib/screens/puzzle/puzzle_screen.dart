import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way_for_ball/utils/shared_prefs.dart';

import 'blocs/puzzle/puzzle_bloc.dart';
import 'blocs/timer/timer_bloc.dart';
import 'puzzle_widgets/widgets.dart';

class PuzzleScreen extends StatefulWidget {
  final int? level;
  const PuzzleScreen({Key? key, this.level}) : super(key: key);

  @override
  _PuzzleScreenState createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  int playerLevel = int.parse(SharedPrefUtils.playerLevel);
  var disableTiles = true;

  @override
  void initState() {
    super.initState();
    print(playerLevel);
    context.read<PuzzleBloc>().add(InitPuzzle(widget.level ?? playerLevel));
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    final bool widthLarger = _width > _height;
    final double _boardSize = PuzzleBloc.getBoardSize(context);

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Board(
                        child: Stack(
                          children: const [
                            PuzzleView(),
                            BallView(),
                          ],
                        ),
                      ),
                      widthLarger
                          ? PuzzleBottomView(level: widget.level ?? playerLevel)
                          : Container(),
                    ],
                  ),
                  widthLarger
                      ? Container()
                      : PuzzleBottomView(level: widget.level ?? playerLevel),
                ],
              ),
            ),
          ),
          AnimatedTextKit(
            totalRepeatCount: 1,
            onFinished: () {
              BlocProvider.of<TimerBloc>(context).add(TimerStarted());
              setState(() {
                disableTiles = false;
              });
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
          disableTiles
              ? Container(
                  width: _boardSize,
                  height: _boardSize,
                  color: Colors.transparent,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
