import 'package:flutter/material.dart';
import 'overflow_theme.dart';

/// A custom painter for drawing the progress bar.
class ProgressPainter extends CustomPainter {
  final double total;
  final double progress;
  final Color backgroundColor;
  final Color progressColor;
  final Color overflowColor;
  final Color borderColor;
  final OverflowTheme overflowTheme;
  final BorderRadius borderRadius;

  ProgressPainter({
    required this.total,
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
    required this.overflowColor,
    required this.borderColor,
    required this.overflowTheme,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = borderColor;

    final rect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, size.width, size.height),
      topLeft: borderRadius.topLeft,
      topRight: borderRadius.topRight,
      bottomLeft: borderRadius.bottomLeft,
      bottomRight: borderRadius.bottomRight,
    );

    // Background
    paint.color = backgroundColor;
    canvas.drawRRect(rect, paint);

    // Calculate progress
    final progressRatio = (progress / total).clamp(0.0, double.infinity);
    final normalizedProgress = progressRatio.clamp(0.0, 1.0);

    // Draw progress
    paint.color = progressColor;
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, size.width * normalizedProgress, size.height),
        topLeft: borderRadius.topLeft,
        bottomLeft: borderRadius.bottomLeft,
        topRight: normalizedProgress == 1.0 ? borderRadius.topRight : Radius.zero,
        bottomRight: normalizedProgress == 1.0 ? borderRadius.bottomRight : Radius.zero,
      ),
      paint,
    );

    // Draw overflow, if any
    if (progressRatio > 1.0) {
      final overflowWidth = size.width * (progressRatio - 1.0).clamp(0.0, 1.0);
      final overflowRect = RRect.fromRectAndCorners(
        Rect.fromLTWH(
            size.width - overflowWidth, 0, overflowWidth, size.height),
        topRight: borderRadius.topRight,
        bottomRight: borderRadius.bottomRight,
      );

      // Background for overflow part
      paint.color = overflowColor;
      canvas.drawRRect(overflowRect, paint);

      // Stripes for overflow part
      _drawStripes(canvas, overflowRect, overflowTheme);
    }

    // Draw border
    canvas.drawRRect(rect, borderPaint);
  }

  void _drawStripes(Canvas canvas, RRect rect, OverflowTheme theme) {
    final stripePaint = Paint()
      ..color = theme.stripeColor
      ..strokeWidth = theme.stripeWidth
      ..strokeCap = StrokeCap.round;

    canvas.save();
    canvas.clipRRect(rect);

    for (double x = rect.left - rect.height;
        x < rect.right + theme.stripeWidth + theme.stripeSpacing;
        x += theme.stripeWidth + theme.stripeSpacing) {
      canvas.drawLine(
        Offset(x, rect.top),
        Offset(x + rect.height, rect.bottom),
        stripePaint,
      );
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}