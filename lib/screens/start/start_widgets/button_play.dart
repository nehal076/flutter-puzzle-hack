import 'package:flutter/material.dart';
import 'package:roll_the_ball/utils/popup/levels/levels_popup.dart';

class ButtonPlay extends StatefulWidget {
  const ButtonPlay({Key? key}) : super(key: key);

  @override
  _ButtonPlayState createState() => _ButtonPlayState();
}

class _ButtonPlayState extends State<ButtonPlay> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          LevelPopup.show(context);
        },
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        child: isHovered
            ? Image.asset('assets/images/btn_play_hover.png')
            : Image.asset('assets/images/btn_play.png'),
      ),
    );
  }
}
