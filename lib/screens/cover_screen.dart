import 'package:flutter/material.dart';

class CoverScreen extends StatelessWidget {
  final bool gameHasStarted;
  const CoverScreen({Key? key, required this.gameHasStarted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: const Alignment(0, -0.5),
        child: Text(
          gameHasStarted ? '' : 'R O L L  T H E  B A L L',
          style: const TextStyle(
            color: Colors.white,
          ),
        ));
  }
}
