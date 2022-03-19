import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:way_for_ball/utils/popup/settings/volume.dart';

class ButtonSetting extends StatefulWidget {
  const ButtonSetting({Key? key}) : super(key: key);

  @override
  _ButtonSettingState createState() => _ButtonSettingState();
}

class _ButtonSettingState extends State<ButtonSetting> {
  bool isHovered = false;

  static getRatioSize(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 0.90;
    final double _height = MediaQuery.of(context).size.height * 0.90;

    final double ratioSize = _width > _height ? _height : _width;

    return ratioSize;
  }

  @override
  Widget build(BuildContext context) {
    double ratioSize = getRatioSize(context);
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Volume.show(context);
        },
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        child: SizedBox(
          width: ratioSize * 0.20,
          height: ratioSize * 0.20,
          child: isHovered
              ? SvgPicture.asset(
                  'assets/images/btn_setting.svg',
                  fit: BoxFit.cover,
                )
              : SvgPicture.asset(
                  'assets/images/btn_setting.svg',
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
