import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CombinedAnimationScreen(),
  ));
}

class CombinedAnimationScreen extends StatefulWidget {
  @override
  _CombinedAnimationScreenState createState() =>
      _CombinedAnimationScreenState();
}

class _CombinedAnimationScreenState extends State<CombinedAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true); // Repeat animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00F260), Color(0xFF0575E6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  // Custom paint for the expanding and contracting circles
                  CustomPaint(
                    painter: ExpandingCirclesPainter(_controller.value),
                    child: const SizedBox(
                      width: 300,
                      height: 300,
                    ),
                  ),
                  // Custom paint for the rotating square
                  CustomPaint(
                    painter: RotatingSquarePainter(_controller.value),
                    child: SizedBox(
                      width: 150,
                      height: 150,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ExpandingCirclesPainter extends CustomPainter {
  final double progress;

  ExpandingCirclesPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Gradient paint with fading effect
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.deepPurple.withOpacity(1.0 - progress);

    // Draw multiple expanding circles
    for (int i = 1; i <= 5; i++) {
      final radius = (size.width / 10) * i * progress;
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RotatingSquarePainter extends CustomPainter {
  final double progress;

  RotatingSquarePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [Colors.deepPurpleAccent, Colors.orangeAccent, Colors.pink],
        stops: [0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final center = Offset(size.width / 2, size.height / 2);
    final side = size.width / 2;

    // Apply rotation transformation
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(2 * pi * progress);
    canvas.translate(-center.dx, -center.dy);

    final rect = Rect.fromCenter(center: center, width: side, height: side);
    canvas.drawRect(rect, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
