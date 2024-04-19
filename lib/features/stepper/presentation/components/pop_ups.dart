import 'package:flutter/material.dart';

Future<int> showHeightDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const HeighDialogWidget(),
  ).then((value) {
    final userHeight = int.parse(value);
    return userHeight;
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
    return AlertDialog(
      title: const Text('Введите ваш рост'),
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(hintText: "Рост в см"),
      ),
      actions: [
        AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return TextButton(
                onPressed: controller.text.isNotEmpty ? () => Navigator.of(context).pop(controller.text) : null,
                child: const Text('Готово'),
              );
            }),
      ],
    );
  }
}
