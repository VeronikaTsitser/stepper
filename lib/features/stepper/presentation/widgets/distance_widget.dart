import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/features/stepper/logic/pedometer_bloc/pedometer_bloc.dart';
import 'package:stepper/features/stepper/logic/stepper_bloc/stepper_bloc.dart';
import 'package:stepper/features/stepper/logic/user_characteristics_notifier.dart';
import 'package:stepper/features/stepper/utils/utils.dart';

class DistanceWidget extends StatelessWidget {
  const DistanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pedometerSteps = context.watch<PedometerBloc>().state.steps;
    final allSteps = context.watch<StepperBloc>().state.allSteps;
    final steps = getSteps(allSteps, pedometerSteps);
    return Text('Расстояние: ${calculateDistance(context, steps)} км', style: const TextStyle(fontSize: 20));
  }

  String calculateDistance(BuildContext context, int steps) {
    final stepLength = context.watch<HumanCharacteristicsNotifier>().calculateStepLength();
    final distance = (steps * stepLength) / 1000;
    log('Distance: $distance');
    return distance.toStringAsFixed(2);
  }
}
