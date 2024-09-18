# Animated Overflow Progress Bar Example

This example demonstrates how to use the `AnimatedOverflowProgressBar` widget in a Flutter application.

## Setup

First, add the `animated_overflow_progress_bar` dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  animated_overflow_progress_bar:
    git:
      url: https://github.com/msamoeed/animated_overflow_progress_bar.git
      ref: main
```

## Basic Usage

Here's a simple example of how to use the `AnimatedOverflowProgressBar`:

```dart
import 'package:flutter/material.dart';
import 'package:animated_overflow_progress_bar/animated_overflow_progress_bar.dart';

class ProgressBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress Bar Demo')),
      body: Center(
        child: AnimatedOverflowProgressBar(
          progress: 75,
          total: 100,
          width: 300,
          height: 30,
          backgroundColor: Colors.grey[200]!,
          progressColor: Colors.blue,
          overflowColor: Colors.red[100]!,
          borderColor: Colors.black,
          borderRadius: BorderRadius.circular(15),
          overflowTheme: OverflowTheme(
            stripeColor: Colors.red,
            stripeWidth: 0.75,
            stripeSpacing: 5.0,
          ),
        ),
      ),
    );
  }
}
```

## Advanced Usage

You can create an interactive progress bar that updates its value:

```dart
import 'package:flutter/material.dart';
import 'package:animated_overflow_progress_bar/animated_overflow_progress_bar.dart';

class InteractiveProgressBarDemo extends StatefulWidget {
  @override
  _InteractiveProgressBarDemoState createState() => _InteractiveProgressBarDemoState();
}

class _InteractiveProgressBarDemoState extends State<InteractiveProgressBarDemo> {
  double _progress = 50.0;
  final double _total = 100.0;

  void _incrementProgress() {
    setState(() {
      _progress += 10;
      if (_progress > 150) _progress = 0; // Reset if it goes too high
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interactive Progress Bar Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOverflowProgressBar(
              progress: _progress,
              total: _total,
              width: 300,
              height: 30,
              backgroundColor: Colors.grey[200]!,
              progressColor: Colors.blue,
              overflowColor: Colors.red[100]!,
              borderColor: Colors.black,
              borderRadius: BorderRadius.circular(15),
              overflowTheme: OverflowTheme(
                stripeColor: Colors.red,
                stripeWidth: 0.75,
                stripeSpacing: 5.0,
              ),
            ),
            SizedBox(height: 20),
            Text('Progress: $_progress / $_total'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementProgress,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

## Customization

The `AnimatedOverflowProgressBar` widget offers various customization options:

- `width` and `height`: Set the dimensions of the progress bar.
- `backgroundColor`: Set the background color of the progress bar.
- `progressColor`: Set the color of the progress indicator.
- `overflowColor`: Set the color of the overflow section.
- `borderColor`: Set the color of the border around the progress bar.
- `borderRadius`: Customize the roundness of the corners.
- `overflowTheme`: Customize the appearance of the overflow section, including stripe color, width, and spacing.

Experiment with these properties to achieve the desired look for your application.

## Running the Example

To run this example:

1. Ensure you have Flutter installed on your machine.
2. Create a new Flutter project.
3. Replace the contents of your `main.dart` file with either of the example codes provided above.
4. Run the app using `flutter run` command.

This will give you a hands-on experience with the `AnimatedOverflowProgressBar` widget and help you understand how to integrate it into your own projects.