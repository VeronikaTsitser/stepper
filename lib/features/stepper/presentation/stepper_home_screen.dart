import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stepper/features/stepper/domain/models/step_model.dart';
import 'package:stepper/features/stepper/logic/bloc/stepper_bloc.dart';
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
  StreamSubscription<StepCount>? _subscription;
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const SettingsButton(),
      body: Center(
        child: BlocBuilder<StepperBloc, StepperState>(
          builder: (context, state) {
            return StreamBuilder<StepCount>(
                stream: Pedometer.stepCountStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  int steps = getSteps(state.allSteps, snapshot.data?.steps ?? 0);

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
                        onValueChanged: (value) {
                          if (value) {
                            if (state.allSteps.isEmpty) {
                              startListeningSteps();
                            }
                            if (isInitialized) {
                              context
                                  .read<StepperBloc>()
                                  .add(StepperEvent.toggleTracking(steps: snapshot.data?.steps ?? 0));
                            }
                          } else if (!value) {
                            showPermissionSettingsDialog(context).then((value) => openAppSettings());
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      DistanceWidget(steps: steps),
                      const SizedBox(height: 20),
                      const WalkingTimer(),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }

  int getSteps(List<StepModel> allSteps, int step) {
    int steps = 0;

    if (isInitialized) {
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

  void onStepCount(StepCount event) async {
    int steps = event.steps;
    if (isInitialized == true) {
      return;
    } else {
      final state = context.read<StepperBloc>().state;
      if (state.allSteps.isEmpty) {
        final completer = Completer();
        context.read<StepperBloc>().add(StepperEvent.toggleTracking(steps: steps, completer: completer));
        await completer.future;
      }
      isInitialized = true;
      setState(() {});
    }
  }

  void startListeningSteps() {
    _subscription ??= Pedometer.stepCountStream.listen(
      onStepCount,
      onError: onStepCountError,
      cancelOnError: true,
    );
  }

  void onStepCountError(error) {
    log('Failed to get step count: $error');
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
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
