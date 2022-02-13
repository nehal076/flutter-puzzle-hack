import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/background-6.svg',
            fit: BoxFit.cover,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: child,
          ),
        ],
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
