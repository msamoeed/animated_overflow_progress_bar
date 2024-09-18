import 'package:flutter/material.dart';
import 'overflow_theme.dart';
import 'progress_painter.dart';

/// A customizable animated progress bar widget with overflow indication.
class AnimatedOverflowProgressBar extends StatefulWidget {
  /// The total value that represents 100% progress.
  final double total;

  /// The current progress value.
  final double progress;

  /// The width of the progress bar.
  final double width;

  /// The height of the progress bar.
  final double height;

  /// The duration of the progress animation.
  final Duration animationDuration;

  /// The background color of the progress bar.
  final Color backgroundColor;

  /// The color of the progress indicator.
  final Color progressColor;

  /// The color of the overflow section.
  final Color overflowColor;

  /// The color of the border around the progress bar.
  final Color borderColor;

  /// The theme for the overflow section.
  final OverflowTheme overflowTheme;

  /// The border radius of the progress bar.
  final BorderRadius borderRadius;

  /// Creates an [AnimatedOverflowProgressBar] with customizable properties.
  ///
  /// The [total] and [progress] parameters are required. All other parameters
  /// have default values and are optional.
  const AnimatedOverflowProgressBar({
    Key? key,
    required this.total,
    required this.progress,
    this.width = 300,
    this.height = 30,
    this.animationDuration = const Duration(milliseconds: 500),
    this.backgroundColor = const Color(0xFFEDE8FD),
    this.progressColor = Colors.blue,
    this.overflowColor = Colors.white,
    this.borderColor = Colors.black,
    this.overflowTheme = const OverflowTheme(),
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
  }) : super(key: key);

  @override
  State<AnimatedOverflowProgressBar> createState() => _AnimatedOverflowProgressBarState();
}

class _AnimatedOverflowProgressBarState extends State<AnimatedOverflowProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedOverflowProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress || oldWidget.total != widget.total) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: ProgressPainter(
              total: widget.total,
              progress: widget.progress * _animation.value,
              backgroundColor: widget.backgroundColor,
              progressColor: widget.progressColor,
              overflowColor: widget.overflowColor,
              borderColor: widget.borderColor,
              overflowTheme: widget.overflowTheme,
              borderRadius: widget.borderRadius,
            ),
          );
        },
      ),
    );
  }
}