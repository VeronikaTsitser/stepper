import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/features/stepper/logic/stepper_bloc/stepper_bloc.dart';

class WalkingTimeWidget extends StatefulWidget {
  const WalkingTimeWidget({super.key});

  @override
  State<WalkingTimeWidget> createState() => _WalkingTimeWidgetState();
}

class _WalkingTimeWidgetState extends State<WalkingTimeWidget> {
  Timer? _timer;

  StepperState get stepperState => context.read<StepperBloc>().state;
  int get _walkingTime => stepperState.walkingTime;
  bool get _isPaused => stepperState.allSteps.isNotEmpty ? stepperState.allSteps.last.isPaused : true;
  int _newWalkingTime = 0;

  void startTimer() {
    _newWalkingTime = _walkingTime;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, onTick);
  }

  void onTick(Timer timer) {
    if (!_isPaused && stepperState.allSteps.isNotEmpty) {
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
