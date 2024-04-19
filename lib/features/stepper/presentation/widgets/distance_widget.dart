import 'dart:developer';

import 'package:flutter/material.dart';

class DistanceWidget extends StatefulWidget {
  const DistanceWidget({super.key, required this.steps, required this.userHeight});
  final int steps;
  final int userHeight;

  @override
  State<DistanceWidget> createState() => _DistanceWidgetState();
}

class _DistanceWidgetState extends State<DistanceWidget> {
  int? userHeight;

  @override
  Widget build(BuildContext context) {
    return Text('Расстояние: ${calculateDistance(widget.steps, calculateStepLength(widget.userHeight))} км',
        style: const TextStyle(fontSize: 20));
  }

  double calculateStepLength(int userHeight) {
    final stepLength = userHeight * 0.415 / 100;
    log('Step length: $stepLength');
    return stepLength;
  }

  String calculateDistance(int steps, double stepLength) {
    final distance = (steps * stepLength) / 1000;
    log('Distance: $distance');
    return distance.toStringAsFixed(2);
  }
}
