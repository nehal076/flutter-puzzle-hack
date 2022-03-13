import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roll_the_ball/utils/screens.dart';
import 'package:roll_the_ball/utils/shared_prefs.dart';

class LevelTile extends StatelessWidget {
  final String level;
  const LevelTile(
    this.level, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isNextLevel =
        int.parse(SharedPrefUtils.playerLevel) + 1 == int.parse(level);
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(
          context,
          Screens.puzzle_screen,
          arguments: int.parse(level),
        );
      },
      child: Container(
        margin: kIsWeb ? const EdgeInsets.all(10) : null,
        decoration: BoxDecoration(
          color: const Color(0xffD5711F),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SharedPrefUtils.getUserStringValue("level$level") != "" ||
                    isNextLevel
                ? Column(
                    children: [
                      Text(
                        level,
                        style: TextStyle(
                          color: Colors.brown[700],
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          fontFamily: 'Shizuru',
                        ),
                      ),
                      isNextLevel
                          ? Container()
                          : Text(
                              getTime(level),
                              style: TextStyle(
                                color: Colors.brown[700],
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                    ],
                  )
                : Icon(Icons.lock, color: Colors.brown[700])
          ],
        ),
      ),
    );
  }

  static getData(String level) {
    var data = jsonDecode(
      SharedPrefUtils.getUserStringValue('level$level'),
    );
    return data;
  }

  static getTime(String level) {
    return getData(level)['time'].toString();
  }
}
