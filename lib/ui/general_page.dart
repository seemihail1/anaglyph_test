import 'package:anaglyph_test/ui/cube/rotatable_cube.dart';
import 'package:flutter/material.dart';

import 'anaglyph/renderer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Anaglyph test'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  late AnimationController _yController;

  @override
  void initState() {
    super.initState();

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _yController.repeat();
  }

  @override
  void dispose() {
    _yController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: AnaglyphViewRenderObject(
              key: super.widget.key,
              depth: 11,
              child: const RotatableCube(sideSize: 150),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AnaglyphViewRenderObject(
              key: super.widget.key,
              depth: 8,
              child: const RotatableCube(),
            ),
          ),
          Positioned(
            bottom: 170,
            left: 100,
            child: AnaglyphViewRenderObject(
              key: super.widget.key,
              depth: 12,
              child: const RotatableCube(sideSize: 150),
            ),
          ),
          Positioned(
            top: 220,
            left: -30,
            child: AnaglyphViewRenderObject(
              key: super.widget.key,
              depth: 6,
              child: const RotatableCube(sideSize: 100),
            ),
          ),
        ],
      ),
    );
  }
}
