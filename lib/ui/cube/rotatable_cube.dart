import 'dart:math';

import 'package:anaglyph_test/ui/cube/cube.dart';
import 'package:flutter/material.dart';

class RotatableCube extends StatefulWidget {
  const RotatableCube({
    super.key,
    this.sideSize = 140,
  });

  final double sideSize;

  @override
  RotatableCubeState createState() => RotatableCubeState();
}

class RotatableCubeState extends State<RotatableCube> {
  double _x = pi * 0.25;
  double _y = pi * 0.25;

  @override
  Widget build(BuildContext context) {
    final double size = widget.sideSize;

    return GestureDetector(
      onPanUpdate: (DragUpdateDetails u) => setState(() {
        _x = (_x + -u.delta.dy / 150) % (pi * 2);
        _y = (_y + -u.delta.dx / 150) % (pi * 2);
      }),
      child: SizedBox(
        height: size * 2,
        width: size * 2,
        child: Cube(
          color: Colors.grey.shade200,
          x: _x,
          y: _y,
          size: size,
        ),
      ),
    );
  }
}
