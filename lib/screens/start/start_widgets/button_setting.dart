import 'package:flutter/material.dart';

class ButtonSetting extends StatefulWidget {
  const ButtonSetting({Key? key}) : super(key: key);

  @override
  _ButtonSettingState createState() => _ButtonSettingState();
}

class _ButtonSettingState extends State<ButtonSetting> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'puzzle_screen');
        },
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        child: isHovered
            ? Image.asset('assets/images/btn_setting_hover.png')
            : Image.asset('assets/images/btn_setting.png'),
      ),
    );
  }
}
