import 'package:flutter/material.dart';

class WinButton extends StatelessWidget {
  final String number;
  final String text;
  final VoidCallback onTap;

  const WinButton({
    Key? key,
    required this.number,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset('assets/images/buttons/tile0$number.png'),
            Material(
              color: Colors.transparent,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xffFFF99E),
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
