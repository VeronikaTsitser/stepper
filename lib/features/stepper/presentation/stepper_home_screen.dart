import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stepper/features/stepper/domain/models/step_model.dart';
import 'package:stepper/features/stepper/logic/bloc/stepper_bloc.dart';
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
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.clear();
        },
        child: const Icon(Icons.refresh),
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
                      Text('$steps', style: const TextStyle(fontSize: 30)),
                      const SizedBox(height: 20),
                      Text('Цель: $_stepGoal шагов', style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: LinearProgressIndicator(
                          value: steps / _stepGoal,
                          backgroundColor: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<StepperBloc>()
                              .add(StepperEvent.toggleTracking(steps: snapshot.data?.steps ?? 0));
                        },
                        child: Text(context.read<StepperBloc>().state.allSteps.isNotEmpty &&
                                context.read<StepperBloc>().state.allSteps.last.isPaused
                            ? 'Возобновить'
                            : 'Пауза'),
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

class DistanceWidget extends StatefulWidget {
  const DistanceWidget({super.key, required this.steps});
  final int steps;

  @override
  State<DistanceWidget> createState() => _DistanceWidgetState();
}

class _DistanceWidgetState extends State<DistanceWidget> {
  double _distance = 0.0;
  @override
  Widget build(BuildContext context) {
    return Text('Расстояние: ${calculateDistance(widget.steps)} км', style: const TextStyle(fontSize: 20));
  }

  String calculateDistance(int steps) {
    double stepLength = 0.762; // Средний шаг в метрах
    _distance = (steps * stepLength) / 1000;
    return _distance.toStringAsFixed(2);
  }
}
