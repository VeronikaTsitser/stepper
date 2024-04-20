import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/features/stepper/logic/pedometer_bloc/pedometer_bloc.dart';
import 'package:stepper/features/stepper/logic/stepper_bloc/stepper_bloc.dart';
import 'package:stepper/features/stepper/presentation/widgets/buttons/settings_button.dart';
import 'package:stepper/features/stepper/presentation/widgets/buttons/start_pause_button.dart';
import 'package:stepper/features/stepper/presentation/widgets/current_steps_value_widget.dart';
import 'package:stepper/features/stepper/presentation/widgets/distance_widget.dart';
import 'package:stepper/features/stepper/presentation/widgets/step_goal_widget.dart';
import 'package:stepper/features/stepper/presentation/widgets/steps_progress_indicator.dart';
import 'package:stepper/features/stepper/presentation/widgets/walking_time_widget.dart';

class StepperHomeScreen extends StatelessWidget {
  const StepperHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const SettingsButton(),
      body: BlocListener<PedometerBloc, PedometerState>(
        listenWhen: (previous, current) => previous.isInitialized != current.isInitialized,
        listener: (context, state) => context.read<StepperBloc>().add(StepperEvent.toggleTracking(steps: state.steps)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CurrentStepsValueWidget(),
            SizedBox(height: 20),
            StepGoalWidget(),
            SizedBox(height: 20),
            StepsProgressIndicator(),
            SizedBox(height: 20),
            StartPauseButton(),
            SizedBox(height: 20),
            DistanceWidget(),
            SizedBox(height: 20),
            WalkingTimeWidget(),
          ],
        ),
      ),
    );
  }
}
