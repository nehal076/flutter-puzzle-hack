import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Board extends StatelessWidget {
  final Widget child;
  const Board({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 300, // TODO: make it dynamic
      width: 300,
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/board.svg',
            fit: BoxFit.cover,
          ),
          child,
        ],
      ),
    );
  }
}
