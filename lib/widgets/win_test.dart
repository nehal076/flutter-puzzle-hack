import 'package:flutter/material.dart';
import 'package:roll_the_ball/utils/popup/levels/widgets/level_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class WinTest extends StatelessWidget {
  const WinTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle'),
      ),
      body: Column(
        children: [
          const HeightBox(100),
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xff912514),
              borderRadius: BorderRadius.circular(20),
            ),
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: List.generate(16, (index) {
                return LevelTile('${index + 1}');
              }),
            ).pOnly(top: 20),
          )
        ],
      ),
    );
  }
}
