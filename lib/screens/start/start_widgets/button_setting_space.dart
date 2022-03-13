import 'package:flutter/material.dart';

class ButtonSettingSpace extends StatefulWidget {
  const ButtonSettingSpace({Key? key}) : super(key: key);

  @override
  _ButtonSettingState createState() => _ButtonSettingState();
}

class _ButtonSettingState extends State<ButtonSettingSpace> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/settings.png', width: 150);
  }
}
