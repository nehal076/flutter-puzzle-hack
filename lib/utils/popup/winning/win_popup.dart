import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:roll_the_ball/utils/popup/levels/levels_popup.dart';
import 'package:roll_the_ball/utils/screens.dart';
import 'package:roll_the_ball/utils/shared_prefs.dart';
import 'package:velocity_x/velocity_x.dart';

import 'widgets/win_button.dart';

class WinPopup {
  static show(BuildContext context, int level) {
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
                width: MediaQuery.of(context).size.width * 0.5,
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
                padding: const EdgeInsets.all(40),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Lottie.asset(
                          'assets/lottie/snoopd.json',
                          fit: BoxFit.contain,
                          repeat: true,
                        ),
                      ),
                      const Text(
                        'Level Completed !',
                        style: TextStyle(
                          color: Color(0xffFFF99E),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const HeightBox(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Moves",
                                style: TextStyle(
                                  color: Color(0xffFFF99E),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                getMoves(),
                                style: const TextStyle(
                                  color: Color(0xffFFF99E),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Time",
                                style: TextStyle(
                                  color: Color(0xffFFF99E),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                getTime(),
                                style: const TextStyle(
                                  color: Color(0xffFFF99E),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const HeightBox(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WinButton(
                            text: "Levels",
                            number: "08",
                            onTap: () {
                              LevelPopup.show(context);
                            },
                          ),
                          (level + 1 > 12)
                              ? Container()
                              : WinButton(
                                  text: "Next",
                                  number: "06",
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
              // Lottie.asset(
              //   'assets/lottie/congratulating.json',
              //   repeat: false,
              // ),
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
