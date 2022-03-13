import 'package:flutter/material.dart';
import 'package:roll_the_ball/screens/start/start_widgets/background.dart';
import 'package:roll_the_ball/screens/start/start_widgets/button_play.dart';
import 'package:roll_the_ball/screens/start/start_widgets/logo.dart';

import 'start_widgets/button_setting.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool isSettingHovered = false;
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Logo(),
          ButtonPlay(),
          ButtonSetting(),
        ],
      ),
    );
  }
}
