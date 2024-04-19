import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/features/stepper/logic/user_characteristics_notifier.dart';

class StepsProgressIndicator extends StatelessWidget {
  const StepsProgressIndicator({super.key, required this.steps});
  final int steps;

  @override
  Widget build(BuildContext context) {
    int stepGoal = context.watch<HumanCharacteristicsNotifier>().getStepGoal();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LinearProgressIndicator(
        value: steps / stepGoal,
        backgroundColor: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }
}
