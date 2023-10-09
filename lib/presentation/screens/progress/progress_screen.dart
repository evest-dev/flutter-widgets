import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const ProgressView(),
    );
  }
}

class ProgressView extends StatelessWidget {
  const ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Circular Progress Indicator'),
          SizedBox(height: 20),
          CircularProgressIndicator(
              strokeWidth: 2, backgroundColor: Colors.black12),
          SizedBox(height: 20),
          Text('Circular y Linear Controlado'),
          SizedBox(height: 20),
          _ControlledProgressIndicator()
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value <= 100),
      builder: (BuildContext context, snapshot) {
        final progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                  value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12),
              const SizedBox(width: 20),
              Expanded(child: LinearProgressIndicator(value: progressValue))
            ],
          ),
        );
      },
    );
  }
}