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
                width: 400,
                padding: const EdgeInsets.all(40),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/level-select-dialog.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  children: List.generate(16, (index) {
                    return LevelTile('${index + 1}');
                  }),
                ).pOnly(top: 20),
              ),
              const Positioned(
                top: 25,
                child: Text(
                  'Level Select',
                  style: TextStyle(
                    color: Color.fromARGB(255, 32, 17, 14),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
