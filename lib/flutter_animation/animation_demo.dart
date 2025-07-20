import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> with TickerProviderStateMixin {
  late AnimationController _primaryController;
  late AnimationController _secondaryController;
  late AnimationController _particleController;
  late AnimationController _rippleController;

  final List<Droplet> _droplets = [];
  final List<Particle> _particles = [];
  final List<RippleEffect> _ripples = [];
  final List<NeuralBranch> _branches = [];

  Offset? _lastTouchPoint;
  double _globalPhase = 0;

  @override
  void initState() {
    super.initState();

    _primaryController = AnimationController(
      duration: const Duration(seconds: 10), // Slower animation
      vsync: this,
    )..repeat();

    _secondaryController = AnimationController(
      duration: const Duration(seconds: 15), // Slower animation
      vsync: this,
    )..repeat();

    _particleController = AnimationController(
      duration: const Duration(seconds: 20), // Much slower
      vsync: this,
    )..repeat();

    _rippleController = AnimationController(
      duration: const Duration(seconds: 2), // Faster ripples
      vsync: this,
    );

    _initializeEcosystem();

    _primaryController.addListener(() {
      setState(() {
        _globalPhase = _primaryController.value * 2 * math.pi;
        _updateEcosystem();
      });
    });
  }

  void _initializeEcosystem() {
    // Reduce droplets for better performance (8 -> 4)
    for (int i = 0; i < 4; i++) {
      _droplets.add(
        Droplet(
          center: Offset(
            120 + (i * 80.0) + math.Random().nextDouble() * 100,
            200 + math.Random().nextDouble() * 400,
          ),
          baseRadius: 25 + math.Random().nextDouble() * 15,
          phase: math.Random().nextDouble() * 2 * math.pi,
          speed: 0.3 + math.Random().nextDouble() * 0.5,
          color: HSVColor.fromAHSV(
            0.7,
            180 + i * 30.0, // Fixed colors to avoid HSV calculations
            0.8,
            0.9,
          ).toColor(),
        ),
      );
    }

    // Significantly reduce particles (150 -> 30)
    for (int i = 0; i < 30; i++) {
      _particles.add(
        Particle(
          position: Offset(
            math.Random().nextDouble() * 400,
            math.Random().nextDouble() * 800,
          ),
          velocity: Offset(
            (math.Random().nextDouble() - 0.5) * 1,
            (math.Random().nextDouble() - 0.5) * 1,
          ),
          life: math.Random().nextDouble(),
          maxLife: 3 + math.Random().nextDouble() * 2,
        ),
      );
    }

    // Keep neural branches minimal
    _branches.add(
      NeuralBranch(
        start: const Offset(200, 400),
        angle: 0,
        length: 0,
        generation: 0,
      ),
    );
  }

  void _updateEcosystem() {
    // Update droplets with liquid physics (optimized)
    for (var droplet in _droplets) {
      droplet.update(_globalPhase, _lastTouchPoint);
    }

    // Simplified merge check (less frequent)
    if (_globalPhase % 0.1 < 0.05) {
      // Only check merging occasionally
      for (int i = 0; i < _droplets.length; i++) {
        for (int j = i + 1; j < _droplets.length; j++) {
          final distance = (_droplets[i].center - _droplets[j].center).distance;
          if (distance < _droplets[i].radius + _droplets[j].radius) {
            _droplets[i].merge(_droplets[j]);
            _droplets.removeAt(j);
            break;
          }
        }
      }
    }

    // Update particles with reduced frequency
    if (_globalPhase % 0.05 < 0.025) {
      // Update particles less frequently
      for (var particle in _particles) {
        particle.update(_droplets, _lastTouchPoint);
      }
    }

    // Simplified neural growth
    _updateNeuralGrowth();

    // Clean up old ripples
    _ripples.removeWhere((ripple) => ripple.isComplete);
  }

  void _updateNeuralGrowth() {
    final random = math.Random();

    // Limit total branches to prevent performance issues
    if (_branches.length > 15) return;

    for (int i = _branches.length - 1; i >= 0; i--) {
      _branches[i].grow();

      // Create new branches with stricter conditions
      if (_branches[i].shouldBranch && _branches[i].generation < 3 && random.nextDouble() > 0.6) {
        // Reduce branching probability
        final branchCount = 1 + random.nextInt(2); // Max 2 branches
        for (int j = 0; j < branchCount; j++) {
          _branches.add(
            NeuralBranch(
              start: _branches[i].end,
              angle: _branches[i].angle + (random.nextDouble() - 0.5) * math.pi / 3,
              length: 0,
              generation: _branches[i].generation + 1,
            ),
          );
        }
        _branches[i].shouldBranch = false;
      }
    }
  }

  void _handleTouch(Offset position) {
    setState(() {
      _lastTouchPoint = position;

      // Create ripple effect
      _ripples.add(
        RippleEffect(
          center: position,
          startTime: DateTime.now(),
        ),
      );

      // Disturb nearby droplets
      for (var droplet in _droplets) {
        final distance = (droplet.center - position).distance;
        if (distance < 100) {
          droplet.disturb(position, 100 - distance);
        }
      }

      _rippleController.reset();
      _rippleController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        title: const Text(
          'Liquid Morphing Ecosystem',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTapDown: (details) => _handleTouch(details.localPosition),
        onPanUpdate: (details) => _handleTouch(details.localPosition),
        child: SizedBox.expand(
          child: CustomPaint(
            painter: EcosystemPainter(
              droplets: _droplets,
              particles: _particles,
              ripples: _ripples,
              branches: _branches,
              phase: _globalPhase,
              secondaryPhase: _secondaryController.value * 2 * math.pi,
              particlePhase: _particleController.value * 2 * math.pi,
              touchPoint: _lastTouchPoint,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _primaryController.dispose();
    _secondaryController.dispose();
    _particleController.dispose();
    _rippleController.dispose();
    super.dispose();
  }
}

class Droplet {
  Offset center;
  double baseRadius;
  double radius;
  double phase;
  double speed;
  Color color;
  List<Offset> morphPoints = [];
  double disturbance = 0;
  Offset disturbanceCenter = Offset.zero;

  Droplet({
    required this.center,
    required this.baseRadius,
    required this.phase,
    required this.speed,
    required this.color,
  }) : radius = baseRadius {
    _generateMorphPoints();
  }

  void _generateMorphPoints() {
    morphPoints.clear();
    // Reduce morph points for better performance (16 -> 8)
    for (int i = 0; i < 8; i++) {
      final angle = (i / 8) * 2 * math.pi;
      final variance = 0.85 + math.Random().nextDouble() * 0.3;
      morphPoints.add(
        Offset(
          math.cos(angle) * radius * variance,
          math.sin(angle) * radius * variance,
        ),
      );
    }
  }

  void update(double globalPhase, Offset? touchPoint) {
    // Natural floating movement
    center += Offset(
      math.sin(globalPhase * speed + phase) * 0.5,
      math.cos(globalPhase * speed * 0.7 + phase) * 0.3,
    );

    // Boundary collision with soft bounce
    if (center.dx < baseRadius) {
      center = Offset(baseRadius, center.dy);
    } else if (center.dx > 400 - baseRadius) {
      center = Offset(400 - baseRadius, center.dy);
    }

    if (center.dy < baseRadius) {
      center = Offset(center.dx, baseRadius);
    } else if (center.dy > 800 - baseRadius) {
      center = Offset(center.dx, 800 - baseRadius);
    }

    // Update morph animation
    for (int i = 0; i < morphPoints.length; i++) {
      final angle = (i / morphPoints.length) * 2 * math.pi;
      final waveOffset = math.sin(globalPhase * 2 + angle * 3) * 0.15;
      final disturbanceEffect = disturbance > 0 ? math.exp(-disturbance / 10) * math.sin(globalPhase * 5) * 0.3 : 0;

      final variance = 0.7 + waveOffset + disturbanceEffect;
      morphPoints[i] = Offset(
        math.cos(angle) * radius * variance,
        math.sin(angle) * radius * variance,
      );
    }

    // Reduce disturbance over time
    disturbance = math.max(0, disturbance - 1);

    // Color shifting
    final hue = (HSVColor.fromColor(color).hue + globalPhase * 10) % 360;
    color = HSVColor.fromAHSV(
      0.6 + math.sin(globalPhase * 3) * 0.2,
      hue,
      0.8,
      0.7 + math.sin(globalPhase * 2) * 0.2,
    ).toColor();
  }

  void disturb(Offset point, double intensity) {
    disturbance = intensity;
    disturbanceCenter = point;
  }

  void merge(Droplet other) {
    // Grow larger when merging
    radius = math.sqrt(radius * radius + other.radius * other.radius);
    baseRadius = radius;

    // Blend colors
    final thisHsv = HSVColor.fromColor(color);
    final otherHsv = HSVColor.fromColor(other.color);
    color = HSVColor.fromAHSV(
      (thisHsv.alpha + otherHsv.alpha) / 2,
      (thisHsv.hue + otherHsv.hue) / 2,
      (thisHsv.saturation + otherHsv.saturation) / 2,
      (thisHsv.value + otherHsv.value) / 2,
    ).toColor();

    _generateMorphPoints();
  }
}

class Particle {
  Offset position;
  Offset velocity;
  double life;
  double maxLife;
  Color color;
  double size;

  Particle({
    required this.position,
    required this.velocity,
    required this.life,
    required this.maxLife,
  })  : color = HSVColor.fromAHSV(
          0.8,
          math.Random().nextDouble() * 60 + 180, // Blue-green spectrum
          0.7,
          0.9,
        ).toColor(),
        size = 1 + math.Random().nextDouble() * 3;

  void update(List<Droplet> droplets, Offset? touchPoint) {
    // Age the particle
    life += 0.016; // Approximate 60fps

    // Attraction to nearest droplet
    if (droplets.isNotEmpty) {
      Droplet nearest = droplets.first;
      double minDistance = (position - nearest.center).distance;

      for (var droplet in droplets) {
        final distance = (position - droplet.center).distance;
        if (distance < minDistance) {
          minDistance = distance;
          nearest = droplet;
        }
      }

      // Apply attraction force
      if (minDistance > 10) {
        final direction = (nearest.center - position).normalized();
        velocity += direction * (0.1 / (minDistance / 100));
      }
    }

    // Repulsion from touch point
    if (touchPoint != null) {
      final distance = (position - touchPoint).distance;
      if (distance < 80 && distance > 0) {
        final repulsion = (position - touchPoint).normalized() * (80 - distance) * 0.01;
        velocity += repulsion;
      }
    }

    // Apply velocity with damping
    position += velocity;
    velocity *= 0.98;

    // Boundary wrapping
    if (position.dx < 0) position = Offset(400, position.dy);
    if (position.dx > 400) position = Offset(0, position.dy);
    if (position.dy < 0) position = Offset(position.dx, 800);
    if (position.dy > 800) position = Offset(position.dx, 0);

    // Respawn if too old
    if (life > maxLife) {
      position = Offset(
        math.Random().nextDouble() * 400,
        math.Random().nextDouble() * 800,
      );
      life = 0;
      velocity = Offset(
        (math.Random().nextDouble() - 0.5) * 2,
        (math.Random().nextDouble() - 0.5) * 2,
      );
    }

    // Update color based on life
    final lifeFactor = 1 - (life / maxLife);
    color = HSVColor.fromAHSV(
      lifeFactor * 0.8,
      180 + lifeFactor * 60,
      0.7,
      lifeFactor * 0.9,
    ).toColor();
  }
}

class RippleEffect {
  final Offset center;
  final DateTime startTime;

  RippleEffect({required this.center, required this.startTime});

  double get age => DateTime.now().difference(startTime).inMilliseconds / 1000.0;
  bool get isComplete => age > 2.0;
  double get radius => age * 100;
  double get opacity => math.max(0, 1 - age / 2);
}

class NeuralBranch {
  Offset start;
  double angle;
  double length;
  double targetLength;
  int generation;
  bool shouldBranch = false;

  NeuralBranch({
    required this.start,
    required this.angle,
    required this.length,
    required this.generation,
  }) : targetLength = 50 + math.Random().nextDouble() * 100 / (generation + 1);

  Offset get end =>
      start +
      Offset(
        math.cos(angle) * length,
        math.sin(angle) * length,
      );

  void grow() {
    if (length < targetLength) {
      length += 0.5;
      if (length >= targetLength * 0.7 && !shouldBranch) {
        shouldBranch = true;
      }
    }
  }
}

class EcosystemPainter extends CustomPainter {
  final List<Droplet> droplets;
  final List<Particle> particles;
  final List<RippleEffect> ripples;
  final List<NeuralBranch> branches;
  final double phase;
  final double secondaryPhase;
  final double particlePhase;
  final Offset? touchPoint;

  EcosystemPainter({
    required this.droplets,
    required this.particles,
    required this.ripples,
    required this.branches,
    required this.phase,
    required this.secondaryPhase,
    required this.particlePhase,
    this.touchPoint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Create gradient background
    final backgroundGradient = ui.Gradient.radial(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.8,
      [
        Color.lerp(
          const Color(0xFF001122),
          const Color(0xFF003344),
          (math.sin(phase * 0.5) + 1) / 2,
        )!,
        const Color(0xFF000011),
      ],
      [0.0, 1.0],
    );

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = backgroundGradient,
    );

    // Draw neural branches
    _drawNeuralBranches(canvas);

    // Draw particles
    _drawParticles(canvas);

    // Draw liquid droplets
    _drawDroplets(canvas);

    // Draw ripple effects
    _drawRipples(canvas);

    // Draw touch interaction
    _drawTouchEffect(canvas);
  }

  void _drawNeuralBranches(Canvas canvas) {
    final paint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (var branch in branches) {
      if (branch.length > 5) {
        final opacity = math.max(0.1, 1.0 - branch.generation * 0.2);
        paint.color = Color.lerp(
          Colors.cyan.withOpacity(opacity),
          Colors.blue.withOpacity(opacity),
          (math.sin(phase + branch.angle) + 1) / 2,
        )!;

        canvas.drawLine(branch.start, branch.end, paint);

        // Add glow effect
        paint.strokeWidth = 3;
        paint.color = paint.color.withOpacity(opacity * 0.3);
        canvas.drawLine(branch.start, branch.end, paint);
        paint.strokeWidth = 1;
      }
    }
  }

  void _drawParticles(Canvas canvas) {
    final paint = Paint();

    for (var particle in particles) {
      paint.color = particle.color;

      // Simplified particle rendering - no blur for performance
      paint.maskFilter = null;
      canvas.drawCircle(particle.position, particle.size, paint);
    }
  }

  void _drawDroplets(Canvas canvas) {
    for (var droplet in droplets) {
      _drawLiquidDroplet(canvas, droplet);
    }
  }

  void _drawLiquidDroplet(Canvas canvas, Droplet droplet) {
    final path = Path();

    // Create organic liquid shape
    if (droplet.morphPoints.isNotEmpty) {
      final firstPoint = droplet.center + droplet.morphPoints[0];
      path.moveTo(firstPoint.dx, firstPoint.dy);

      for (int i = 1; i < droplet.morphPoints.length; i++) {
        final currentPoint = droplet.center + droplet.morphPoints[i];
        final nextPoint = droplet.center + droplet.morphPoints[(i + 1) % droplet.morphPoints.length];

        final controlPoint1 = Offset.lerp(currentPoint, nextPoint, 0.5)!;
        path.quadraticBezierTo(
          currentPoint.dx,
          currentPoint.dy,
          controlPoint1.dx,
          controlPoint1.dy,
        );
      }

      path.close();
    }

    // Create gradient paint
    final gradient = ui.Gradient.radial(
      droplet.center,
      droplet.radius,
      [
        droplet.color.withOpacity(0.9),
        droplet.color.withOpacity(0.3),
        droplet.color.withOpacity(0.1),
      ],
      [0.0, 0.7, 1.0],
    );

    final paint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.fill;

    // Simplified drawing - remove heavy blur effects for performance
    // Draw main droplet with minimal blur
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 1);
    canvas.drawPath(path, paint);

    // Draw core without blur
    paint.maskFilter = null;
    paint.color = droplet.color.withOpacity(0.9);
    canvas.drawPath(path, paint);

    // Simple highlight without additional blur
    paint.color = Colors.white.withOpacity(0.2);
    canvas.drawCircle(
      droplet.center + Offset(-droplet.radius * 0.3, -droplet.radius * 0.3),
      droplet.radius * 0.15,
      paint,
    );
  }

  void _drawRipples(Canvas canvas) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (var ripple in ripples) {
      if (!ripple.isComplete) {
        paint.color = Colors.white.withOpacity(ripple.opacity);
        canvas.drawCircle(ripple.center, ripple.radius, paint);

        paint.strokeWidth = 1;
        paint.color = Colors.cyan.withOpacity(ripple.opacity * 0.5);
        canvas.drawCircle(ripple.center, ripple.radius * 0.7, paint);
        paint.strokeWidth = 2;
      }
    }
  }

  void _drawTouchEffect(Canvas canvas) {
    if (touchPoint != null) {
      final paint = Paint()
        ..color = Colors.white.withOpacity(0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      final pulseRadius = 20 + math.sin(phase * 10) * 5;
      canvas.drawCircle(touchPoint!, pulseRadius, paint);

      paint.color = Colors.cyan.withOpacity(0.3);
      paint.strokeWidth = 1;
      canvas.drawCircle(touchPoint!, pulseRadius * 1.5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

extension on Offset {
  Offset normalized() {
    final magnitude = distance;
    return magnitude > 0 ? this / magnitude : Offset.zero;
  }
}
