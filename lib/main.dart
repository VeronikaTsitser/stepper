import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

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
  final int _stepGoal = 10000; // Цель по шагам
  bool _isPaused = false; // Состояние паузы
  final double _distance = 0.0; // Пройденное расстояние в км
  final Duration _walkingTime = const Duration(); // Общее время ходьбы
  StreamSubscription<StepCount>? _subscription;
  String _stepCountValue = '0';
  int _initialSteps = 0;
  int _lastStepsBeforePause = 0;

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    final status = await Permission.activityRecognition.request();
    if (status == PermissionStatus.granted) {
      print("Permission granted");
      startListening(); // Запустить слежение за шагами
    } else {
      print("Permission denied");
      // Обработка отказа в предоставлении разрешения
    }
  }

  void startListening() {
    _subscription ??= Pedometer.stepCountStream.listen(
      onStepCount,
      onError: onStepCountError,
      onDone: onStepCountDone,
      cancelOnError: true,
    );
  }

  void onStepCount(StepCount event) {
    if (_initialSteps == 0) {
      // Сохраняем начальное значение шагов
      _initialSteps = event.steps;
    }

    if (!_isPaused) {
      int sessionSteps = event.steps - _initialSteps; // Вычисляем шаги сделанные во время сессии
      print("Step count: $sessionSteps"); // Выводим количество шагов в консоль
      setState(() {
        _stepCountValue = "$sessionSteps";
      });
    }
  }

  void pauseResumeTracking() {
    print("Current pause state: $_isPaused"); // Проверяем текущее состояние перед изменением
    setState(() {
      if (_isPaused) {
        print("Resuming...");
        // Возобновление подписки
        _isPaused = false;
      } else {
        print("Pausing...");
        // Пауза в подписке
        _lastStepsBeforePause = int.parse(_stepCountValue); // Сохраняем последнее значение шагов
        _isPaused = true;
        _subscription = null;
        _subscription?.cancel(); // Останавливаем подписку
      }
    });
  }

  void onStepCountError(error) {
    print('Failed to get step count: $error');
    setState(() {
      _stepCountValue = 'Step Count not available';
    });
  }

  void onStepCountDone() {
    _subscription?.cancel();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

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
            Text('Шаги: ${_isPaused ? _lastStepsBeforePause : _stepCountValue}', style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            Text('Цель: $_stepGoal шагов', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressIndicator(
                value: int.parse(_stepCountValue) / _stepGoal,
                backgroundColor: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: pauseResumeTracking,
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

  String formatDuration(Duration d) {
    return d.toString().split('.').first;
  }
}
