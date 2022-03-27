import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:way_for_ball/utils/popup/levels/levels_popup.dart';
import 'package:way_for_ball/utils/screens.dart';
import 'package:way_for_ball/utils/shared_prefs.dart';
import 'package:velocity_x/velocity_x.dart';

import 'widgets/win_button.dart';

class WinPopup {
  static show(BuildContext context, int level) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    final bool widthLarger = _width > _height;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: widthLarger
                    ? MediaQuery.of(context).size.width * 0.5
                    : MediaQuery.of(context).size.width * 0.7,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffEEEEEE),
                      Color(0xff444542),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Level Completed ',
                        style: TextStyle(
                          color: Color(0xff055799),
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          fontFamily: 'Cairo',
                        ),
                        textAlign: TextAlign.center,
                      ).centered(),
                      const HeightBox(20),
                      Row(
                        mainAxisAlignment: widthLarger
                            ? MainAxisAlignment.spaceEvenly
                            : MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Moves",
                                style: TextStyle(
                                  color: Color(0xff346CB1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                getMoves(),
                                style: const TextStyle(
                                  color: Color(0xff346CB1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Time",
                                style: TextStyle(
                                  color: Color(0xff346CB1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                getTime(),
                                style: const TextStyle(
                                  color: Color(0xff346CB1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.40,
                        child: Lottie.asset(
                          'assets/lottie/snoopd.json',
                          fit: BoxFit.contain,
                          repeat: true,
                        ),
                      ),
                      const HeightBox(20),
                      const HeightBox(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WinButton(
                            text: "Levels",
                            name: "levels",
                            onTap: () {
                              LevelPopup.show(context);
                            },
                          ),
                          (level + 1 > 12)
                              ? Container()
                              : WinButton(
                                  text: "Next",
                                  name: "next",
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                      context,
                                      Screens.puzzle_screen,
                                      arguments: level + 1,
                                    );
                                  },
                                ),
                        ],
                      ),
                    ],
                  ).pOnly(top: 20),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static getData() {
    var data = jsonDecode(
      SharedPrefUtils.getUserStringValue('level${SharedPrefUtils.playerLevel}'),
    );
    return data;
  }

  static getMoves() {
    return getData()['moves'].toString();
  }

  static getTime() {
    return getData()['time'].toString();
  }
}
