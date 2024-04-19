import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedometer/pedometer.dart';
import 'package:stepper/features/stepper/logic/bloc/stepper_bloc.dart';

class StartPauseButton extends StatelessWidget {
  const StartPauseButton({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot<StepCount> snapshot;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<StepperBloc>().add(StepperEvent.toggleTracking(steps: snapshot.data?.steps ?? 0));
      },
      child: Text(context.read<StepperBloc>().state.allSteps.isNotEmpty &&
              context.read<StepperBloc>().state.allSteps.last.isPaused
          ? 'Старт'
          : 'Пауза'),
    );
  }
}
