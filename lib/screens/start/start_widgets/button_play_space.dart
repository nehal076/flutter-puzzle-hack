import 'package:flutter/material.dart';

class ButtonPlaySpace extends StatefulWidget {
  const ButtonPlaySpace({Key? key}) : super(key: key);

  @override
  _ButtonPlayState createState() => _ButtonPlayState();
}

class _ButtonPlayState extends State<ButtonPlaySpace> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assets/images/earth.png', width: 200),
        const CircleAvatar(
          radius: 60,
          backgroundColor: Color(0xff52B7C5),
        ),
        const CircleAvatar(
          radius: 59,
          backgroundColor: Colors.black,
        ),
        ClipPath(
          clipper: CustomTriangleClipper(),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xff52B7C5),
              border: Border.all(
                color: Colors.black,
                width: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.height, size.width / 2)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
