import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class WinPopup {
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
                height: 400,
                padding: const EdgeInsets.all(40),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/end-game-dialog.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const HeightBox(220),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/buttons/tile008.png'),
                          Image.asset('assets/images/buttons/tile018.png'),
                          Image.asset('assets/images/buttons/tile006.png')
                        ],
                      ),
                    ],
                  ).pOnly(top: 20),
                ),
              ),
              Positioned(
                top: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/star-small.png'),
                    Image.asset('assets/images/star-big.png'),
                    Image.asset('assets/images/star-small.png')
                  ],
                ),
              ),
              const Positioned(
                top: 70,
                child: Text(
                  'Level Complete',
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
