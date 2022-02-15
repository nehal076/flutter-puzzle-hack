import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PuzzleTopView extends StatefulWidget {
  const PuzzleTopView({Key? key}) : super(key: key);

  @override
  _PuzzleTopViewState createState() => _PuzzleTopViewState();
}

class _PuzzleTopViewState extends State<PuzzleTopView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/ui-frame-top.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: SizedBox(
            height: 200,
            width: context.screenWidth,
          ),
        ),
        SizedBox(
          // width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset('assets/images/star-small.png', fit: BoxFit.cover),
              Image.asset('assets/images/star-big.png', fit: BoxFit.cover),
              Image.asset('assets/images/star-small.png', fit: BoxFit.cover)
            ],
          ).pOnly(top: 20),
        )
      ],
    );
  }
}
