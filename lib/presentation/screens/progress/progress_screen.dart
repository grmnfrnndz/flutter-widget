

import 'package:flutter/material.dart';


class ProgressScreen extends StatelessWidget {

static const String name = 'progress_screen';

  const ProgressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text('Cicular Progress Indicator'),
          const CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black12,),
          
          const SizedBox(height: 30),
          const Text('Cicular Progress Checked'),
          const SizedBox(height: 10),
          _ControlledProgressIndicator(),


        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2.0) /100.0;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black26,),
              const SizedBox(width: 10),
    
              Expanded(child: LinearProgressIndicator(value: progressValue))
            ],
          ),
        );
      }
    );
  }
}