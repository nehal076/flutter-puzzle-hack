import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final bool widthLarger = width > height;

    return Positioned(
      top: y,
      left: x,
      child: SizedBox(
        height: width * (widthLarger ? 0.05 : 0.2),
        width: width * (widthLarger ? 0.05 : 0.2),
        child: const RiveAnimation.asset('assets/rive/bird.riv'),
      ),
    );
  }
}
