import 'package:animated_overflow_progress_bar/src/progress_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_overflow_progress_bar/animated_overflow_progress_bar.dart';

void main() {
  testWidgets('AnimatedOverflowProgressBar displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: AnimatedOverflowProgressBar(
              progress: 50,
              total: 100,
              width: 300,
              height: 30,
            ),
          ),
        ),
      ),
    );

    // Verify that the AnimatedOverflowProgressBar is rendered.
    expect(find.byType(AnimatedOverflowProgressBar), findsOneWidget);

    // Verify that the CustomPaint widget (used for drawing the progress bar) is present.
    expect(find.byType(CustomPaint), findsOneWidget);
  });

  testWidgets('AnimatedOverflowProgressBar updates on progress change', (WidgetTester tester) async {
    // Create a stateful widget to hold the progress value
    Widget testWidget = StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return const MaterialApp(
          home: Scaffold(
            body: AnimatedOverflowProgressBar(
              progress: 50,
              total: 100,
              width: 300,
              height: 30,
            ),
          ),
        );
      },
    );

    await tester.pumpWidget(testWidget);

    // Get the initial CustomPaint widget
    final initialCustomPaint = tester.widget<CustomPaint>(find.byType(CustomPaint));

    // Update the progress
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AnimatedOverflowProgressBar(
            progress: 75,
            total: 100,
            width: 300,
            height: 30,
          ),
        ),
      ),
    );

    // Wait for the animation to complete
    await tester.pumpAndSettle();

    // Get the updated CustomPaint widget
    final updatedCustomPaint = tester.widget<CustomPaint>(find.byType(CustomPaint));

    // Verify that the CustomPaint widget has been updated
    expect(initialCustomPaint, isNot(equals(updatedCustomPaint)));
  });

  testWidgets('AnimatedOverflowProgressBar shows overflow correctly', (WidgetTester tester) async {
    // Build our app with progress exceeding total
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: AnimatedOverflowProgressBar(
              progress: 120,
              total: 100,
              width: 300,
              height: 30,
              overflowColor: Colors.red,
            ),
          ),
        ),
      ),
    );

    // Wait for the animation to complete
    await tester.pumpAndSettle();

    // Verify that the AnimatedOverflowProgressBar is rendered
    expect(find.byType(AnimatedOverflowProgressBar), findsOneWidget);

    // Get the CustomPaint widget
    final customPaint = tester.widget<CustomPaint>(find.byType(CustomPaint));
    
    // Check if the painter is of type ProgressPainter
    expect(customPaint.painter, isInstanceOf<ProgressPainter>());

    // You might want to add more specific tests here to verify the overflow is drawn correctly.
    // This could involve writing custom matcher functions to inspect the painted canvas,
    // which is beyond the scope of this basic test suite.
  });
}