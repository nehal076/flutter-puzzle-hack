import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wood.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
/* SVG mein error mil rahi thi :( */
// Center(
//   child: Stack(
//     alignment: Alignment.center,
//     children: [
//       SvgPicture.asset(
//         'assets/images/wood.svg',
//         fit: BoxFit.cover,
//       ),
//       child,
//     ],
//   ),
// );
