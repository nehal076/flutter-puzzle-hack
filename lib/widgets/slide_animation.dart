import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SlidingAnimation extends StatelessWidget {
  final Widget child;
  final int index;
  const SlidingAnimation({
    Key? key,
    required this.child,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        horizontalOffset: -50.0,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
