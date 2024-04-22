import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stepper/core/services/permission_service.dart';
import 'package:stepper/features/stepper/presentation/components/pop_ups.dart';

class CheckPermissionButton extends StatelessWidget {
  const CheckPermissionButton({super.key, required this.onPermissionGranted, required this.child});

  final VoidCallback onPermissionGranted;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => checkActivityPermissions().then((value) => value
          ? onPermissionGranted.call()
          : showPermissionSettingsDialog(context).then((value) => openAppSettings())),
      child: child,
    );
  }
}
