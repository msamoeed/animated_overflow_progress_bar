import 'package:flutter/material.dart';
import 'package:animated_overflow_progress_bar/animated_overflow_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Overflow Progress Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animated Overflow Progress Bar Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _progress = 50.0;
  final double _total = 100.0;

  void _incrementProgress() {
    setState(() {
      _progress += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOverflowProgressBar(
              progress: _progress,
              total: _total,
              width: 300,
              height: 30,
              backgroundColor: Colors.grey[200]!,
              progressColor: Colors.blue,
              overflowColor: Colors.grey[100]!,
              borderColor: Colors.black,
              borderRadius: BorderRadius.circular(15),
              overflowTheme: const OverflowTheme(
                stripeColor: Colors.red,
                stripeWidth: 0.75,
                stripeSpacing: 5.0,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Progress: $_progress / $_total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementProgress,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}