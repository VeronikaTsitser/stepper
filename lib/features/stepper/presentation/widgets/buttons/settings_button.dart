import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stepper/features/stepper/logic/user_characteristics_notifier.dart';
import 'package:stepper/features/stepper/presentation/components/pop_ups.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () => showHeightDialog(context)
              .then((value) => context.read<HumanCharacteristicsNotifier>().setUserHeight(value)),
          child: const Icon(Icons.settings),
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.clear();
          },
          child: const Icon(Icons.clear),
        ),
      ],
    );
  }
}
