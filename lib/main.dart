import 'package:flutter/material.dart';
import 'package:stepper/features/stepper/presentation/stepper_home_screen.dart';

void main() {
  runApp(const StepperApp());
}

class StepperApp extends StatelessWidget {
  const StepperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StepperHomeScreen(),
    );
  }
}
