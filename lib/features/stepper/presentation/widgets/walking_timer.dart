import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/features/stepper/logic/bloc/stepper_bloc.dart';

class WalkingTimer extends StatefulWidget {
  const WalkingTimer({super.key});

  @override
  State<WalkingTimer> createState() => _WalkingTimerState();
}

class _WalkingTimerState extends State<WalkingTimer> {
  Timer? _timer;

  StepperState get stepperState => context.read<StepperBloc>().state;
  int get _walkingTime => stepperState.walkingTime;
  bool get _isPaused => stepperState.allSteps.isNotEmpty ? stepperState.allSteps.last.isPaused : false;
  int _newWalkingTime = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, onTick);
  }

  void onTick(Timer timer) {
    if (!_isPaused) {
      setState(() {
        DateTime currentTime = DateTime.now();
        DateTime lastStepDate = stepperState.allSteps.last.date;
        int secFromLastStepToNow = currentTime.difference(lastStepDate).inSeconds;
        _newWalkingTime = _walkingTime + secFromLastStepToNow;
      });
    }
  }

  String formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    String formattedTime =
        "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    return formattedTime;
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Время ходьбы: ${formatTime(_newWalkingTime)}', style: const TextStyle(fontSize: 20));
  }
}
