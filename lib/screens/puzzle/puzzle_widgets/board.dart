import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Board extends StatelessWidget {
  final Widget child;
  const Board({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 0.90;
    final double _height = MediaQuery.of(context).size.height * 0.90;

    final double _boardSize = _width > _height ? _height : _width;

    return Center(
      child: SizedBox(
        height: _boardSize,
        width: _boardSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.90,
              width: MediaQuery.of(context).size.width * 0.90,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: SvgPicture.asset(
                  'assets/images/board.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
