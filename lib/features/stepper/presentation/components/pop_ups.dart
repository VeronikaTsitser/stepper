import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<int> showHeightDialog(BuildContext context, int userHeigh) {
  return showCupertinoModalPopup(
    barrierDismissible: false,
    context: context,
    builder: (context) => HeighDialogWidget(userHeigh: userHeigh),
  ).then((value) {
    log('Height: $value');
    return value;
  });
}

class HeighDialogWidget extends StatelessWidget {
  const HeighDialogWidget({super.key, required this.userHeigh});
  final int userHeigh;

  @override
  Widget build(BuildContext context) {
    int currentUserHeigh = userHeigh;
    List<int> generateNumberList(int start, int end) => List<int>.generate(end - start + 1, (index) => start + index);
    final valuesList = generateNumberList(81, 230);
    final initialIndex = valuesList.indexOf(currentUserHeigh);

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Укажите ваш рост', style: TextStyle(fontSize: 20)),
          const Text('для более точного расчета пройденного расстояния', textAlign: TextAlign.center),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: CupertinoPicker(
              itemExtent: 32,
              useMagnifier: true,
              onSelectedItemChanged: (int index) => currentUserHeigh = valuesList[index],
              scrollController: FixedExtentScrollController(initialItem: initialIndex),
              children: valuesList.map((e) => Center(child: Text('$e'))).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(currentUserHeigh),
            child: const Text('Сохранить'),
          )
        ],
      ),
    );
  }
}

Future<int> showStepGoalDialog(BuildContext context, int stepGoal) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => StepGoalDialogWidget(stepGoal: stepGoal),
  ).then((value) {
    log('Step goal: $value');
    return value;
  });
}

class StepGoalDialogWidget extends StatelessWidget {
  const StepGoalDialogWidget({super.key, required this.stepGoal});
  final int stepGoal;

  @override
  Widget build(BuildContext context) {
    int currentStepGoal = stepGoal;
    List<int> generateNumberList(int start, int end, int step) =>
        List<int>.generate(((end - start) / step).ceil() + 1, (index) => start + index * step);
    final valuesList = generateNumberList(1000, 20000, 1000);
    final initialIndex = valuesList.indexOf(currentStepGoal);
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Укажите вашу цель', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: CupertinoPicker(
              itemExtent: 32,
              useMagnifier: true,
              onSelectedItemChanged: (int index) => currentStepGoal = valuesList[index],
              scrollController: FixedExtentScrollController(initialItem: initialIndex),
              children: valuesList.map((e) => Center(child: Text('$e'))).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(currentStepGoal),
            child: const Text('Сохранить'),
          )
        ],
      ),
    );
  }
}

Future<void> showPermissionSettingsDialog(BuildContext context) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Необходимо разрешение'),
        content: const Text('Для работы приложения необходимо разрешение на использование педометра'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Перейти в настройки'),
          ),
        ],
      ),
    );
