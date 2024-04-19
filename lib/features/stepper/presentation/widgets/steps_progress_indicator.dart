import 'package:flutter/material.dart';

class StepsProgressIndicator extends StatelessWidget {
  const StepsProgressIndicator({
    super.key,
    required this.steps,
    required int stepGoal,
  }) : _stepGoal = stepGoal;

  final int steps;
  final int _stepGoal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LinearProgressIndicator(
        value: steps / _stepGoal,
        backgroundColor: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }
}
