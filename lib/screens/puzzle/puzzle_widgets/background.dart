import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final bool widthLarger = width > height;
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: height,
              width: width,
              child: SvgPicture.asset(
                'assets/images/board-background.svg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: widthLarger ? width * 0.05 : width * 0.12,
              left: widthLarger ? width * 0.80 : width * .70,
              child: SvgPicture.asset(
                'assets/images/moon.svg',
                width: widthLarger ? width * .15 : width * 0.25,
                height: widthLarger ? width * .15 : width * 0.25,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
