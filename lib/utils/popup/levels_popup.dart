import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(40),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/level-select-dialog.png'),
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 4,
                  // mainAxisSpacing: 10,
                  shrinkWrap: true,
                  children: List.generate(16, (index) {
                    return LevelTile('${index + 1}');
                  }),
                ).pOnly(top: 20),
              ),

              // IntrinsicHeight(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       for (var i = 0; i < 4; i++)
              //         Row(
              //           children: [
              //             for (var j = 0; j < 4; j++)
              //               InkWell(
              //                 onTap: () {
              //                   Navigator.pushNamed(
              //                     context,
              //                     'puzzle_screen',
              //                     arguments: 1,
              //                   );
              //                 },
              //                 child: Stack(
              //                   alignment: Alignment.center,
              //                   children: [
              //                     Image.asset(
              //                       'assets/images/level_tile_star_1.png',
              //                     ),
              //                     Positioned(
              //                       top: 4,
              //                       child: Text(
              //                         '$i',
              //                         style: TextStyle(
              //                           color: Colors.brown[900],
              //                           fontWeight: FontWeight.w700,
              //                         ),
              //                       ),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //           ],
              //         )
              //     ],
              //   ).pOnly(top: 20),
              // ),

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
        Navigator.pushNamed(
          context,
          'puzzle_screen',
          arguments: 1,
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/level_tile_star_1.png',
          ),
          Positioned(
            top: 4,
            child: Text(
              level,
              style: TextStyle(
                color: Colors.brown[900],
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
