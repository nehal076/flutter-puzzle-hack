import 'package:flutter/material.dart';
import 'package:roll_the_ball/layout/layout.dart';

class Board extends StatelessWidget {
  final Widget child;
  const Board({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ResponsiveLayoutBuilder(
          small: (_, child) => child,
          medium: (_, child) => child,
          large: (_, child) => child,
          child: (currentSize) {
            return Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/board.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: child,
            );
          },
        ),
      ],
    );
  }
}
