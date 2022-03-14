import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'widgets/level_tile.dart';

class LevelPopup {
  static show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            width: kIsWeb ? 400 : context.screenWidth * 0.90,
            height: kIsWeb ? null : context.screenHeight * 0.90,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff912514),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Text(
                  "Select a Level",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const HeightBox(20),
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(8, (index) {
                    return LevelTile('${index + 1}');
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
