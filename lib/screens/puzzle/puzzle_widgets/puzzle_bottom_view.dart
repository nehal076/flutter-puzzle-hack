import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:way_for_ball/screens/puzzle/blocs/ball/ball_bloc.dart';
import 'package:way_for_ball/utils/popup/settings/volume.dart';
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
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    final bool widthLarger = _width > _height;

    List<Widget> buttons = [
      GameButton(
        "back",
        "Back",
        widthLarger: widthLarger,
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      const SizedBox(width: 8),
      GameButton(
        "restart",
        "Restart",
        widthLarger: widthLarger,
        onTap: () {
          context.read<PuzzleBloc>().add(InitPuzzle(widget.level));
          context.read<BallBloc>().add(BallInitalize());
          context.read<BallBloc>().add(InitalizeBall(context));
          context.read<TimerBloc>().add(TimerStop());
          context.read<TimerBloc>().add(TimerStarted());
        },
      ),
      const SizedBox(width: 8),
      GameButton(
        "setting",
        "Setting",
        onTap: () {
          Volume.show(context);
        },
        widthLarger: widthLarger,
      ),
    ];

    return Container(
      alignment: Alignment.center,
      child: widthLarger
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buttons,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buttons,
            ),
    );
  }
}

class GameButton extends StatefulWidget {
  final String name;
  final String text;
  final VoidCallback onTap;
  final bool widthLarger;
  const GameButton(
    this.name,
    this.text, {
    Key? key,
    required this.onTap,
    required this.widthLarger,
  }) : super(key: key);

  @override
  State<GameButton> createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton> {
  bool disableButton = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BallBloc, BallState>(
      builder: (context, state) {
        if (state is BallRolling) {
          disableButton = true;
        } else {
          disableButton = false;
        }
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: disableButton ? null : widget.onTap,
            child: Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: disableButton
                      ? SvgPicture.asset(
                          'assets/images/disabled_${widget.name}.svg',
                        )
                      : SvgPicture.asset('assets/images/${widget.name}.svg'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
