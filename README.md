# Animated Overflow Progress Bar

A customizable animated progress bar widget for Flutter applications, featuring overflow indication.

## Features

- Smooth animation when progress changes
- Customizable colors for background, progress, and overflow
- Overflow indication with customizable striped pattern
- Flexible sizing options
- Customizable border radius

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  animated_overflow_progress_bar: ^1.0.0
```

## Usage

```dart
import 'package:animated_overflow_progress_bar/animated_overflow_progress_bar.dart';

AnimatedOverflowProgressBar(
  total: 100,
  progress: 75,
  width: 300,
  height: 30,
  animationDuration: Duration(milliseconds: 500),
  backgroundColor: Colors.grey[200]!,
  progressColor: Colors.blue,
  overflowColor: Colors.grey[100]!,
  borderColor: Colors.black,
  borderRadius: BorderRadius.circular(15),
  overflowTheme: OverflowTheme(
    stripeColor: Colors.red,
    stripeWidth: 0.75,
    stripeSpacing: 5.0,
  ),
)
```

## Customizing Border Radius

You can customize the border radius of the progress bar using the `borderRadius` property:

```dart
// Fully rounded corners
borderRadius: BorderRadius.circular(15)

// Only round the left side
borderRadius: BorderRadius.only(
  topLeft: Radius.circular(15),
  bottomLeft: Radius.circular(15),
)

// Custom radius for each corner
borderRadius: BorderRadius.only(
  topLeft: Radius.circular(10),
  topRight: Radius.circular(20),
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(40),
)
```

## Overflow Indication

When the progress exceeds the total value, the widget automatically displays an overflow section with customizable striped pattern. This makes it easy to visualize when a limit has been exceeded.

## Additional information

For more information on how to use this package, please refer to the API documentation or visit the [GitHub repository](https://github.com/msamoeed/animated_overflow_progress_bar).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.