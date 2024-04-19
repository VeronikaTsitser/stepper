import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
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
  final int _stepGoal = 1000; // Цель по шагам
  StreamSubscription<StepCount>? _subscription;
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showHeightDialog(context)
            .then((value) => context.read<HumanCharacteristicsNotifier>().setUserHeight(value)),
        //     () async {
        //   final prefs = await SharedPreferences.getInstance();
        //   prefs.clear();
        // },
        child: const Icon(Icons.settings),
      ),
      appBar: AppBar(
        title: const Text('My Stepper'),
      ),
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
                      StepGoalWidget(stepGoal: _stepGoal),
                      const SizedBox(height: 20),
                      StepsProgressIndicator(steps: steps, stepGoal: _stepGoal),
                      const SizedBox(height: 20),
                      StartPauseButton(snapshot: snapshot),
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

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    final status = await Permission.activityRecognition.request();
    if (status == PermissionStatus.granted) {
      log("Permission granted");
      startListeningSteps();
    } else {
      log("Permission denied");
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
