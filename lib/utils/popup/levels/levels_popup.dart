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
          content: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: context.screenWidth * 0.90,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xff912514),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // padding: const EdgeInsets.all(20),
                  children: List.generate(16, (index) {
                    return LevelTile('${index + 1}');
                  }),
                ),
              ),
              // const Positioned(
              //   top: 25,
              //   child: Text(
              //     'Level Select',
              //     style: TextStyle(
              //       color: Color.fromARGB(255, 32, 17, 14),
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
