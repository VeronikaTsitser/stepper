import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/features/core/services/permission_service.dart';
import 'package:stepper/features/stepper/logic/bloc/stepper_bloc.dart';

class StartPauseButton extends StatelessWidget {
  const StartPauseButton({super.key, required this.onValueChanged});

  final ValueChanged<bool> onValueChanged;

  @override
  Widget build(BuildContext context) {
    final allSteps = context.read<StepperBloc>().state.allSteps;
    return ElevatedButton(
      onPressed: () => checkActivityPermissions().then((value) => onValueChanged(value)),
      child: Text(allSteps.isNotEmpty && allSteps.last.isPaused || allSteps.isEmpty ? 'Старт' : 'Пауза'),
    );
  }
}
