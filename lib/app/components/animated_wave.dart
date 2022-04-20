import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedWave extends StatefulWidget {
  const AnimatedWave({Key? key}) : super(key: key);

  @override
  State<AnimatedWave> createState() => _AnimatedWaveState();
}

class _AnimatedWaveState extends State<AnimatedWave>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        value: 0.0,
        duration: const Duration(seconds: 15),
        upperBound: 1,
        lowerBound: -1,
        vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
              clipper: DrawClip(_controller.value),
              child: Container(
                height: size.height * 0.3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(255, 89, 57, 250),
                        Color.fromARGB(255, 134, 0, 175)
                      ]),
                ),
              ),
            ),
            ClipPath(
              clipper: DrawClip(_controller.value * 2),
              child: Container(
                height: size.height * 0.3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(255, 205, 57, 250),
                        Color.fromARGB(255, 20, 0, 175)
                      ]),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    final y1 = math.sin(5 * move);
    final y2 = math.sin(5 * move + math.pi / 2);
    final y3 = math.sin(5 * move + math.pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);
    Path path = Path();
    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
