import 'package:flutter/material.dart';

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
            Container(
              height: MediaQuery.of(context).size.height * 0.90,
              width: MediaQuery.of(context).size.width * 0.90,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 2.0),
                  )
                ],
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
