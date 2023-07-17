import 'package:flutter/material.dart';
import 'constants.dart';
import 'styles.dart';

class AnaglyphStyleData {
  const AnaglyphStyleData({
    this.stereoPairStyle = kDefaultStereoPairStyle,
    this.filterQuality = kDefaultFilterQuality,
    this.depth = kDefaultDepth,
    this.clipOuters = kDefaultClipOuters,
  });

  final AnaglyphStereoPairStyle stereoPairStyle;
  final FilterQuality filterQuality;
  final double depth;
  final bool clipOuters;

  AnaglyphStyleData copyWith({
    AnaglyphStereoPairStyle? stereoPairStyle,
    FilterQuality? filterQuality,
    Duration? transitionDuration,
    Curve? transitionCurve,
    double? depth,
    bool? clipOuters,
  }) {
    return AnaglyphStyleData(
      stereoPairStyle: stereoPairStyle ?? this.stereoPairStyle,
      filterQuality: filterQuality ?? this.filterQuality,
      depth: depth ?? this.depth,
      clipOuters: clipOuters ?? this.clipOuters,
    );
  }

  static AnaglyphStyleData lerp(
    AnaglyphStyleData a,
    AnaglyphStyleData b,
    double t,
  ) {
    return AnaglyphStyleData(
      clipOuters: t < 0.5 ? a.clipOuters : b.clipOuters,
      depth: Tween<double>(
        begin: a.depth,
        end: b.depth,
      ).transform(t),
      filterQuality: t < 0.5 ? a.filterQuality : b.filterQuality,
      stereoPairStyle: b.stereoPairStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is! AnaglyphStyleData) return false;
    return stereoPairStyle == other.stereoPairStyle &&
        filterQuality == other.filterQuality &&
        depth == other.depth &&
        clipOuters == other.clipOuters;
  }

  @override
  int get hashCode {
    return Object.hash(
      stereoPairStyle,
      filterQuality,
      depth,
      clipOuters,
    );
  }

  @override
  String toString() {
    return "AnaglyphStyleData($stereoPairStyle, $filterQuality, $depth, $clipOuters)";
  }
}

class AnaglyphStereoPairStyle {
  const AnaglyphStereoPairStyle({
    required this.leftChannel,
    required this.rightChannel,
  });

  const AnaglyphStereoPairStyle.trueAnaglyph({
    this.leftChannel = trueAnaglyphLeftChannelStyle,
    this.rightChannel = trueAnaglyphRightChannelStyle,
  });

  const AnaglyphStereoPairStyle.mono({
    this.leftChannel = monoLeftChannelStyle,
    this.rightChannel = monoRightChannelStyle,
  });

  const AnaglyphStereoPairStyle.trueColor({
    this.leftChannel = trueColorLeftChannelStyle,
    this.rightChannel = trueColorRightChannelStyle,
  });

  const AnaglyphStereoPairStyle.best({
    this.leftChannel = bestColorLeftChannelStyle,
    this.rightChannel = bestColorRightChannelStyle,
  });

  static AnaglyphStereoPairStyle lerp(
    AnaglyphStereoPairStyle a,
    AnaglyphStereoPairStyle b,
    double t,
  ) {
    return AnaglyphStereoPairStyle(
      leftChannel: AnaglyphStereoChannelStyle.lerp(
        a.leftChannel,
        b.leftChannel,
        t,
      ),
      rightChannel: AnaglyphStereoChannelStyle.lerp(
        a.rightChannel,
        b.rightChannel,
        t,
      ),
    );
  }

  /// Defines the style of the left channel.
  final AnaglyphStereoChannelStyle leftChannel;

  /// Defines the style of the right channel
  final AnaglyphStereoChannelStyle rightChannel;

  @override
  bool operator ==(Object other) {
    if (other is! AnaglyphStereoPairStyle) return false;
    return leftChannel == other.leftChannel &&
        rightChannel == other.rightChannel;
  }

  @override
  int get hashCode {
    return Object.hash(
      leftChannel,
      rightChannel,
    );
  }

  @override
  String toString() {
    return "AnaglyphStereoPairStyle($leftChannel, $rightChannel)";
  }
}

/// Stores the style of a single anaglyph channel
class AnaglyphStereoChannelStyle {
  /// Creates an `AnaglyphStereoChannelStyle`.
  ///
  /// It determines how should an anaglyph channel look.
  ///
  /// `colorFilter` : The color filter that'll be applied to the channel.
  const AnaglyphStereoChannelStyle({
    required this.colorFilter,
  });

  /// The color filter that'll be applied to the channel.
  final ColorFilter colorFilter;

  /// Linearly interpolate between two `AnaglyphStereoChannelStyle`s.
  ///
  /// `a` and `b` are the `AnaglyphStereoChannelStyle` instances you want to
  /// interpolate between.
  ///
  /// The `t` argument represents position on the timeline,
  static AnaglyphStereoChannelStyle lerp(
    AnaglyphStereoChannelStyle a,
    AnaglyphStereoChannelStyle b,
    double t,
  ) {
    return AnaglyphStereoChannelStyle(
      colorFilter: t < 0.5 ? a.colorFilter : b.colorFilter,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is! AnaglyphStereoChannelStyle) return false;
    return colorFilter == other.colorFilter;
  }

  @override
  int get hashCode {
    return colorFilter.hashCode;
  }

  @override
  String toString() {
    return "AnaglyphStereoChannelStyle($colorFilter)";
  }
}
