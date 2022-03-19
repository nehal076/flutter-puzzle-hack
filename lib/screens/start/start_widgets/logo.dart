import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class Logo extends StatefulWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  _ButtonPlayState createState() => _ButtonPlayState();
}

class _ButtonPlayState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: context.screenWidth * 0.90,
        child: SvgPicture.asset(
          'assets/images/way_for_ball.svg',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
