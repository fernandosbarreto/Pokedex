import 'dart:math';

import 'package:flutter/material.dart';

class PokeballRotate extends StatefulWidget {
  final double size;
  const PokeballRotate({
    super.key,
    this.size = 100,
  });

  @override
  State<PokeballRotate> createState() => _PokeballRotateState();
}

class _PokeballRotateState extends State<PokeballRotate>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    setRotation(360);

    controller.forward(from: 0);
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void setRotation(int degrees) {
    final angle = degrees * pi / 180;

    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        child: SizedBox(
          height: widget.size,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset('assets/pokeballs/circularPokeball.png'),
          ),
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: animation.value,
            child: child,
          );
        });
  }
}
