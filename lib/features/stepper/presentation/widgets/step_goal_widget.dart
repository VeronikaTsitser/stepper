import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/features/stepper/logic/user_characteristics_notifier.dart';
import 'package:stepper/features/stepper/presentation/components/pop_ups.dart';

class StepGoalWidget extends StatelessWidget {
  const StepGoalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int stepGoal = context.watch<HumanCharacteristicsNotifier>().getStepGoal();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Цель: $stepGoal шагов', style: const TextStyle(fontSize: 20)),
        IconButton(
            onPressed: () => showStepGoalDialog(context)
                .then((value) => context.read<HumanCharacteristicsNotifier>().setStepGoal(value)),
            icon: const Icon(Icons.edit)),
      ],
    );
  }
}
