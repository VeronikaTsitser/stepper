import 'package:flutter/material.dart';

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

class StepperHomeScreen extends StatelessWidget {
  const StepperHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
