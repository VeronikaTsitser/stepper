import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/features/stepper/logic/pedometer_bloc/pedometer_bloc.dart';
import 'package:stepper/features/stepper/logic/stepper_bloc/stepper_bloc.dart';
import 'package:stepper/features/stepper/logic/user_characteristics_notifier.dart';
import 'package:stepper/features/stepper/utils/utils.dart';

class StepsProgressIndicator extends StatelessWidget {
  const StepsProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final pedometerSteps = context.watch<PedometerBloc>().state.steps;
    final allSteps = context.watch<StepperBloc>().state.allSteps;
    final steps = getSteps(allSteps, pedometerSteps);
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
