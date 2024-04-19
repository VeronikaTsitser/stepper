import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/features/stepper/logic/user_characteristics_notifier.dart';

class DistanceWidget extends StatefulWidget {
  const DistanceWidget({super.key, required this.steps});
  final int steps;

  @override
  State<DistanceWidget> createState() => _DistanceWidgetState();
}

class _DistanceWidgetState extends State<DistanceWidget> {
  int? userHeight;

  @override
  Widget build(BuildContext context) {
    return Text('Расстояние: ${calculateDistance(widget.steps)} км', style: const TextStyle(fontSize: 20));
  }

  String calculateDistance(int steps) {
    if (context.watch<HumanCharacteristicsNotifier>().isInitialized) {
      final stepLength = context.watch<HumanCharacteristicsNotifier>().calculateStepLength();

      final distance = (steps * stepLength) / 1000;
      log('Distance: $distance');
      return distance.toStringAsFixed(2);
    }
    return '';
  }
}
