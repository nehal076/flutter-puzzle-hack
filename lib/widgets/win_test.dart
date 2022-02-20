import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 400,
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
                padding: const EdgeInsets.all(40),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 300,
                        child: Lottie.asset(
                          'assets/lottie/snoopd.json',
                          fit: BoxFit.contain,
                          repeat: true,
                        ),
                      ),
                      const HeightBox(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/buttons/tile008.png'),
                          Image.asset('assets/images/buttons/tile018.png'),
                          Image.asset('assets/images/buttons/tile006.png')
                        ],
                      ),
                      const HeightBox(8),
                      const Text(
                        'Level Complete',
                        style: TextStyle(
                          color: Color.fromARGB(255, 32, 17, 14),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ).pOnly(top: 20),
                ),
              ),
              Lottie.asset(
                'assets/lottie/congratulating.json',
                repeat: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
