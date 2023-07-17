import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'style.dart';

class AnaglyphViewRenderObject extends SingleChildRenderObjectWidget {
  const AnaglyphViewRenderObject({
    required super.key,
    required super.child,
    required this.depth,
    this.blendMode = BlendMode.lighten,
    this.stereoPairStyle = const AnaglyphStereoPairStyle.best(),
    this.clipOuters = false,
  });

  final AnaglyphStereoPairStyle stereoPairStyle;
  final BlendMode blendMode;
  final double depth;
  final bool clipOuters;

  @override
  RenderObject createRenderObject(final BuildContext context) {
    return RenderAnaglyphView(
      stereoPairStyle: stereoPairStyle,
      blendMode: blendMode,
      anaglyphDepth: depth,
      clipOuters: clipOuters,
    );
  }

  @override
  void updateRenderObject(
    final BuildContext context,
    final RenderAnaglyphView renderObject,
  ) {
    renderObject
      ..stereoPairStyle = stereoPairStyle
      ..anaglyphDepth = depth
      ..clipOuters = clipOuters;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(DiagnosticsProperty('stereoPairStyle', stereoPairStyle))
      ..add(DoubleProperty('depth', depth))
      ..add(DiagnosticsProperty<bool>('clipOuters', clipOuters));
  }
}

class RenderAnaglyphView extends RenderProxyBox {
  AnaglyphStereoPairStyle _stereoPairStyle;
  BlendMode _blendMode;
  double _anaglyphDepth;
  bool _clipOuters;

  RenderAnaglyphView({
    required AnaglyphStereoPairStyle stereoPairStyle,
    required BlendMode blendMode,
    required double anaglyphDepth,
    required bool clipOuters,
  })  : _stereoPairStyle = stereoPairStyle,
        _blendMode = blendMode,
        _anaglyphDepth = anaglyphDepth,
        _clipOuters = clipOuters;

  set stereoPairStyle(AnaglyphStereoPairStyle newValue) {
    _stereoPairStyle = newValue;
    markNeedsPaint();
  }

  set blendMode(BlendMode newValue) {
    _blendMode = newValue;
    markNeedsPaint();
  }

  set anaglyphDepth(double newValue) {
    _anaglyphDepth = newValue;
    markNeedsPaint();
  }

  set clipOuters(bool newValue) {
    _clipOuters = newValue;
    markNeedsPaint();
  }

  @override
  void paint(context, offset) {
    const antialiase = false;
    final halfDepth = _anaglyphDepth / 2;
    final offsetChange =
        _clipOuters ? Offset(-halfDepth, 0) : Offset(halfDepth, 0);

    context.canvas.saveLayer(
      (offset - offsetChange) & size,
      Paint()
        ..isAntiAlias = antialiase
        ..colorFilter = _stereoPairStyle.leftChannel.colorFilter
        ..blendMode = _blendMode,
    );

    super.paint(context, offset + Offset(-halfDepth, 0));
    context.canvas.restore();

    context.canvas.saveLayer(
      (offset + offsetChange) & size,
      Paint()
        ..isAntiAlias = antialiase
        ..colorFilter = _stereoPairStyle.rightChannel.colorFilter
        ..blendMode = _blendMode,
    );

    super.paint(context, offset + Offset(halfDepth, 0));
    context.canvas.restore();
  }
}
