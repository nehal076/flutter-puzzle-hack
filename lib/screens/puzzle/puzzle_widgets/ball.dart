import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final double x;
  final double y;
  final double ballSize;

  const Ball(
      {Key? key, required this.x, required this.y, required this.ballSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: y,
      left: x,
      child: Container(
        width: ballSize,
        height: ballSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
