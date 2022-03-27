import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WinButton extends StatelessWidget {
  final String name;
  final String text;
  final VoidCallback onTap;

  const WinButton({
    Key? key,
    required this.name,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final bool widthLarger = width > height;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff444542),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  )
                ],
              ),
              child: SizedBox(
                height: widthLarger ? width * 0.04 : width * 0.1,
                width: widthLarger ? width * 0.04 : width * 0.1,
                child: SvgPicture.asset(
                  'assets/images/buttons/$name.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xfffff0f5),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
