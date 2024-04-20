import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<int> showHeightDialog(BuildContext context) {
  return showCupertinoModalPopup(
    barrierDismissible: false,
    context: context,
    builder: (context) => const HeighDialogWidget(),
  ).then((value) {
    log('Height: $value');
    return value;
  });
}

class HeighDialogWidget extends StatelessWidget {
  const HeighDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int userHeigh = 170;
    List<int> generateNumberList(int start, int end) => List<int>.generate(end - start + 1, (index) => start + index);
    final valuesList = generateNumberList(81, 230);
    final initialIndex = valuesList.indexOf(userHeigh);

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
              onSelectedItemChanged: (int index) => userHeigh = valuesList[index],
              scrollController: FixedExtentScrollController(initialItem: initialIndex),
              children: valuesList.map((e) => Center(child: Text('$e'))).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(userHeigh),
            child: const Text('Сохранить'),
          )
        ],
      ),
    );
  }
}

Future<int> showStepGoalDialog(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => const StepGoalDialogWidget(),
  ).then((value) {
    log('Step goal: $value');
    return value;
  });
}

class StepGoalDialogWidget extends StatelessWidget {
  const StepGoalDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int stepGoal = 10000;
    List<int> generateNumberList(int start, int end, int step) =>
        List<int>.generate(((end - start) / step).ceil() + 1, (index) => start + index * step);
    final valuesList = generateNumberList(1000, 20000, 1000);
    final initialIndex = valuesList.indexOf(stepGoal);
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
              onSelectedItemChanged: (int index) => stepGoal = valuesList[index],
              scrollController: FixedExtentScrollController(initialItem: initialIndex),
              children: valuesList.map((e) => Center(child: Text('$e'))).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(stepGoal),
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
