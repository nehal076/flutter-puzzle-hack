import 'dart:math';

import 'package:flutter/material.dart';
import 'package:way_for_ball/screens/start/start_widgets/bird.dart';

class BirdContainer extends StatefulWidget {
  final double x;
  final double y;
  const BirdContainer({Key? key, required this.x, required this.y})
      : super(key: key);

  @override
  State<BirdContainer> createState() => _BirdContainerState();
}

class _BirdContainerState extends State<BirdContainer> {
  @override
  Widget build(BuildContext context) {
    return getBirds(context);
  }

  getBirds(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final bool widthLarger = width > height;

    List<Widget> birds = [];
    for (var i in List.generate(4, (_) => _)) {
      final random = Random(i);

      birds.add(
        Bird(
          x: widget.x * (i + 1),
          y: widget.y * ((widthLarger ? 0.2 : 0.5) + random.nextDouble()),
        ),
      );
    }

    return Stack(children: birds);
  }
}
