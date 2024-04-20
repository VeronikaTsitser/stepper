import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/features/stepper/logic/pedometer_bloc/pedometer_bloc.dart';
import 'package:stepper/features/stepper/logic/stepper_bloc/stepper_bloc.dart';
import 'package:stepper/features/stepper/presentation/widgets/buttons/check_permission_button.dart';

class StartPauseButton extends StatelessWidget {
  const StartPauseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final stepperState = context.watch<StepperBloc>().state;
    return CheckPermissionButton(
      child: Text(
          stepperState.allSteps.isNotEmpty && stepperState.allSteps.last.isPaused || stepperState.allSteps.isEmpty
              ? 'Старт'
              : 'Пауза'),
      onPermissionGranted: () {
        final pedometerState = context.read<PedometerBloc>().state;
        if (!pedometerState.isInitialized) {
          context.read<PedometerBloc>().add(const PedometerStarted());
        } else {
          context.read<StepperBloc>().add(StepperEvent.toggleTracking(steps: pedometerState.steps));
        }
      },
    );
  }
}
