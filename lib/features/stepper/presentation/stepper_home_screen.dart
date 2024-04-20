import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stepper/features/stepper/domain/models/step_model.dart';
import 'package:stepper/features/stepper/logic/pedometer_bloc/pedometer_bloc.dart';
import 'package:stepper/features/stepper/logic/stepper_bloc/stepper_bloc.dart';
import 'package:stepper/features/stepper/logic/user_characteristics_notifier.dart';
import 'package:stepper/features/stepper/presentation/components/pop_ups.dart';
import 'package:stepper/features/stepper/presentation/widgets/current_steps_value_widget.dart';
import 'package:stepper/features/stepper/presentation/widgets/distance_widget.dart';
import 'package:stepper/features/stepper/presentation/widgets/start_pause_button.dart';
import 'package:stepper/features/stepper/presentation/widgets/step_goal_widget.dart';
import 'package:stepper/features/stepper/presentation/widgets/steps_progress_indicator.dart';
import 'package:stepper/features/stepper/presentation/widgets/walking_timer.dart';

class StepperHomeScreen extends StatefulWidget {
  const StepperHomeScreen({super.key});

  @override
  State<StepperHomeScreen> createState() => _StepperHomeScreenState();
}

class _StepperHomeScreenState extends State<StepperHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const SettingsButton(),
      body: Center(
        child: BlocBuilder<StepperBloc, StepperState>(
          builder: (context, stepperState) {
            return BlocConsumer<PedometerBloc, PedometerState>(
              listenWhen: (previous, current) => previous.isInitialized != current.isInitialized,
              listener: (context, state) =>
                  context.read<StepperBloc>().add(StepperEvent.toggleTracking(steps: state.steps)),
              builder: (context, pedometerState) {
                int steps = getSteps(stepperState.allSteps, pedometerState.steps);

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CurrentStepsValueWidget(steps: steps),
                    const SizedBox(height: 20),
                    const StepGoalWidget(),
                    const SizedBox(height: 20),
                    StepsProgressIndicator(steps: steps),
                    const SizedBox(height: 20),
                    StartPauseButton(
                      isPaused: stepperState.allSteps.isNotEmpty && stepperState.allSteps.last.isPaused ||
                          stepperState.allSteps.isEmpty,
                      onPermissionGranted: () {
                        final pedometerState = context.read<PedometerBloc>().state;
                        if (!pedometerState.isInitialized) {
                          context.read<PedometerBloc>().add(const PedometerStarted());
                        } else {
                          context.read<StepperBloc>().add(StepperEvent.toggleTracking(steps: pedometerState.steps));
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    DistanceWidget(steps: steps),
                    const SizedBox(height: 20),
                    const WalkingTimer(),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () => showHeightDialog(context)
              .then((value) => context.read<HumanCharacteristicsNotifier>().setUserHeight(value)),
          child: const Icon(Icons.settings),
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.clear();
          },
          child: const Icon(Icons.clear),
        ),
      ],
    );
  }
}

int getSteps(List<StepModel> allSteps, int step) {
  int steps = 0;

  if (allSteps.isNotEmpty) {
    List<StepModel> sortedSteps = [...allSteps];
    sortedSteps.sort((a, b) => a.date.compareTo(b.date));

    for (int i = 0; i < sortedSteps.length - 1; i++) {
      if (sortedSteps[i].isPaused == false) {
        steps += sortedSteps[i + 1].step - sortedSteps[i].step;
      }
    }
    if (sortedSteps.last.isPaused == false) {
      steps += step - sortedSteps.last.step;
    }
  }
  return steps;
}
