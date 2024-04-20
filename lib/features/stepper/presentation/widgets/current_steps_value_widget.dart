import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/features/stepper/logic/pedometer_bloc/pedometer_bloc.dart';
import 'package:stepper/features/stepper/logic/stepper_bloc/stepper_bloc.dart';
import 'package:stepper/features/stepper/utils/utils.dart';

class CurrentStepsValueWidget extends StatelessWidget {
  const CurrentStepsValueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pedometerSteps = context.watch<PedometerBloc>().state.steps;
    final allSteps = context.watch<StepperBloc>().state.allSteps;
    final steps = getSteps(allSteps, pedometerSteps);
    return Text('$steps', style: const TextStyle(fontSize: 30));
  }
}
