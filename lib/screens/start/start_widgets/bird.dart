import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:velocity_x/velocity_x.dart';

class Bird extends StatelessWidget {
  final double x;
  final double y;

  const Bird({
    Key? key,
    required this.x,
    required this.y,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: y,
      left: x,
      child: SizedBox(
        height: context.screenWidth * 0.2,
        width: context.screenWidth * 0.2,
        child: const RiveAnimation.asset('assets/rive/bird.riv'),
      ),
    );
  }
}
