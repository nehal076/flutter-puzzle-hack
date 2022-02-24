import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roll_the_ball/utils/screens.dart';
import 'package:velocity_x/velocity_x.dart';

class LevelTile extends StatelessWidget {
  final String level;
  const LevelTile(
    this.level, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const HeightBox(8),
            Text(
              level,
              style: TextStyle(
                color: Colors.brown[700],
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "00:04",
              style: TextStyle(
                color: Colors.brown[700],
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
