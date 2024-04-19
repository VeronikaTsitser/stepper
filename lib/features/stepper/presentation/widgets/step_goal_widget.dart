import 'package:flutter/material.dart';

class StepGoalWidget extends StatelessWidget {
  const StepGoalWidget({
    super.key,
    required this.stepGoal,
  });

  final int stepGoal;

  @override
  Widget build(BuildContext context) {
    return Text('Цель: $stepGoal шагов', style: const TextStyle(fontSize: 20));
  }
}
