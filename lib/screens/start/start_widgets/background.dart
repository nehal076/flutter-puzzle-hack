import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:way_for_ball/screens/start/bloc/bird_bloc.dart';

import 'bird_container.dart';

class Background extends StatefulWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  double width = 0;
  double height = 0;
  bool widthLarger = false;
  double x = 0;
  double y = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<BirdBloc>(context).add(InitializeBird(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    widthLarger = width > height;
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              'assets/images/board-background.svg',
              height: height,
              width: width,
              fit: BoxFit.cover,
              // alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: widthLarger ? width * 0.05 : width * 0.12,
            left: widthLarger ? width * 0.80 : width * .70,
            child: SvgPicture.asset(
              'assets/images/moon.svg',
              width: widthLarger ? width * .15 : width * 0.25,
              height: widthLarger ? width * .15 : width * 0.25,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: widget.child,
          ),
          BlocBuilder<BirdBloc, BirdState>(
            builder: (context, state) {
              if (state is BirdMoving) {
                x = state.x;
                y = state.y;
              }
              return BirdContainer(x: x, y: y);
            },
          ),
        ],
      ),
    );
  }
}
