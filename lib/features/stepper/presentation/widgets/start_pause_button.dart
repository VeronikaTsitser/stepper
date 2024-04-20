import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stepper/features/core/services/permission_service.dart';
import 'package:stepper/features/stepper/presentation/components/pop_ups.dart';

class StartPauseButton extends StatelessWidget {
  const StartPauseButton({super.key, required this.onPermissionGranted, required this.isPaused});
  final bool isPaused;
  final VoidCallback onPermissionGranted;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => checkActivityPermissions().then((value) => value
          ? onPermissionGranted.call()
          : showPermissionSettingsDialog(context).then((value) => openAppSettings())),
      child: Text(isPaused ? 'Старт' : 'Пауза'),
    );
  }
}
