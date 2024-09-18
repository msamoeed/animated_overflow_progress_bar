import 'package:flutter/material.dart';

/// Defines the appearance of the overflow section in the [AnimatedOverflowProgressBar].
class OverflowTheme {
  /// The color of the stripes in the overflow section.
  final Color stripeColor;

  /// The width of each stripe in the overflow section.
  final double stripeWidth;

  /// The spacing between stripes in the overflow section.
  final double stripeSpacing;

  /// Creates an [OverflowTheme] with customizable properties.
  ///
  /// All parameters have default values and are optional.
  const OverflowTheme({
    this.stripeColor = Colors.red,
    this.stripeWidth = 0.5,
    this.stripeSpacing = 4.0,
  });
}