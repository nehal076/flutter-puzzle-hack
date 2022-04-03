import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:way_for_ball/utils/popup/levels/levels_popup.dart';
import 'package:way_for_ball/utils/screens.dart';
import 'package:way_for_ball/utils/shared_prefs.dart';

import 'widgets/win_button.dart';

class WinPopup {
  static show(BuildContext context, int level) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          final double _width = MediaQuery.of(context).size.width;
          final double _height = MediaQuery.of(context).size.height;

          final bool widthLarger = _width > _height;
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
                  padding: EdgeInsets.all(_height * 0.02),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.only(top: _height * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Level Completed ',
                            style: TextStyle(
                              color: const Color(0xff055799),
                              fontWeight: FontWeight.w800,
                              fontSize: _height * 0.02,
                              fontFamily: 'Cairo',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: _height * 0.02),
                          Row(
                            mainAxisAlignment: widthLarger
                                ? MainAxisAlignment.spaceEvenly
                                : MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Moves",
                                    style: TextStyle(
                                      color: const Color(0xff346CB1),
                                      fontWeight: FontWeight.w700,
                                      fontSize: _height * 0.018,
                                    ),
                                  ),
                                  Text(
                                    getMoves(),
                                    style: TextStyle(
                                      color: const Color(0xff346CB1),
                                      fontWeight: FontWeight.w700,
                                      fontSize: _height * 0.018,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Time",
                                    style: TextStyle(
                                      color: const Color(0xff346CB1),
                                      fontWeight: FontWeight.w700,
                                      fontSize: _height * 0.018,
                                    ),
                                  ),
                                  Text(
                                    getTime(),
                                    style: TextStyle(
                                      color: const Color(0xff346CB1),
                                      fontWeight: FontWeight.w700,
                                      fontSize: _height * 0.018,
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
                          SizedBox(height: _height * 0.028),
                          Row(
                            mainAxisAlignment: (level + 1 > 12)
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.spaceEvenly,
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
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
