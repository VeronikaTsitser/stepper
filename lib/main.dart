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

class StepperHomeScreen extends StatefulWidget {
  const StepperHomeScreen({super.key});

  @override
  State<StepperHomeScreen> createState() => _StepperHomeScreenState();
}

class _StepperHomeScreenState extends State<StepperHomeScreen> {
  final int _steps = 5000;
  final int _stepGoal = 10000; // Цель по шагам
  bool _isPaused = false; // Состояние паузы
  final double _distance = 0.0; // Пройденное расстояние в км
  final Duration _walkingTime = const Duration(); // Общее время ходьбы

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Stepper'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Шаги: $_steps', style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            Text('Цель: $_stepGoal шагов', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressIndicator(
                value: _steps / _stepGoal,
                backgroundColor: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: togglePause,
              child: Text(_isPaused ? 'Возобновить' : 'Пауза'),
            ),
            const SizedBox(height: 20),
            Text('Расстояние: ${_distance.toStringAsFixed(2)} км', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text('Время ходьбы: ${formatDuration(_walkingTime)}', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  void togglePause() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  String formatDuration(Duration d) {
    return d.toString().split('.').first;
  }
}
