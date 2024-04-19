import 'package:flutter/material.dart';

class CurrentStepsValueWidget extends StatelessWidget {
  const CurrentStepsValueWidget({
    super.key,
    required this.steps,
  });

  final int steps;

  @override
  Widget build(BuildContext context) {
    return Text('$steps', style: const TextStyle(fontSize: 30));
  }
}
