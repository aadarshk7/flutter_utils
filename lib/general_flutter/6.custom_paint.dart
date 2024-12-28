import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedCirclesScreen(),
  ),);
}

class AnimatedCirclesScreen extends StatefulWidget {
  const AnimatedCirclesScreen({super.key});

  @override
  _AnimatedCirclesScreenState createState() => _AnimatedCirclesScreenState();
}

class _AnimatedCirclesScreenState extends State<AnimatedCirclesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
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
          gradient: RadialGradient(
            colors: [Color(0xFF4CAF50), Color(0xFF388E3C)],
            // colors: [Color(0xFFFFAFBD), Color(0xFFFFC3A0)],
            center: Alignment.center,
            radius: 1.0,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: ExpandingCirclesPainter(_controller.value),
                child: const SizedBox(
                  width: 300,
                  height: 300,
                ),
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
