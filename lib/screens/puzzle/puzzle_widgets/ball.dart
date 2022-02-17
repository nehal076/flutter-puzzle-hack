import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final double x;
  final double y;

  const Ball({
    Key? key,
    required this.x,
    required this.y,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: y,
      left: x,
      child: Container(
        width: 25,
        height: 25,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
