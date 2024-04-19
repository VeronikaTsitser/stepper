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

class HeighDialogWidget extends StatefulWidget {
  const HeighDialogWidget({super.key});

  @override
  State<HeighDialogWidget> createState() => _HeighDialogWidgetState();
}

class _HeighDialogWidgetState extends State<HeighDialogWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int personHeigh = 170;
    List<int> generateNumberList(int start, int end) => List<int>.generate(end - start + 1, (index) => start + index);
    final valuesList = generateNumberList(81, 230);
    final initialIndex = valuesList.indexOf(personHeigh);

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
              onSelectedItemChanged: (int index) => personHeigh = valuesList[index],
              scrollController: FixedExtentScrollController(initialItem: initialIndex),
              children: valuesList.map((e) => Center(child: Text('$e'))).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(personHeigh),
            child: const Text('Сохранить'),
          )
        ],
      ),
    );
  }
}
