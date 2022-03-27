import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'widgets/level_tile.dart';

class LevelPopup {
  static show(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            width: kIsWeb
                ? width < 576
                    ? width * 0.90
                    : 400
                : width * 0.90,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff1e3266),
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
                const SizedBox(height: 20),
                StaggeredGrid.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: width * 0.001,
                  mainAxisSpacing: width * 0.001,
                  children: List.generate(12, (index) {
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
