import 'package:flutter/material.dart';
import 'dart:math';

class Stars extends StatefulWidget {
  const Stars({Key? key}) : super(key: key);

  @override
  State<Stars> createState() => _StarsState();
}

class _StarsState extends State<Stars> with SingleTickerProviderStateMixin {
  final duration = const Duration(seconds: 1);
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: duration, vsync: this)
      ..addListener(() => setState(() {}))
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _ctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: StarsPainter(
          stars: _ctrl.value,
          color: _ctrl.value > 0.8 ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}

class StarsPainter extends CustomPainter {
  final double stars;
  final Color color;

  StarsPainter({required this.stars, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    double stars = this.stars * 10;

    for (var i in List.generate(100, (_) => _)) {
      final random = Random(i);
      final radius = random.nextDouble() * stars / 2;
      final x = random.nextDouble() * size.width + stars;
      final y = random.nextDouble() * size.height + stars;

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant StarsPainter oldDelegate) {
    return oldDelegate.stars != stars;
  }
}
