import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

Future<bool> requestActivityPermission() async {
  bool isGranted = false;
  await Permission.activityRecognition.request().then((status) {
    if (status.isGranted || status.isLimited) {
      log("Permission granted");
      isGranted = true;
    } else {
      log("Permission denied");
      isGranted = false;
    }
  });
  return isGranted;
}

Future<bool> checkActivityPermissions() async {
  bool isGranted = false;
  final status = await Permission.activityRecognition.status;
  if (status.isGranted || status.isLimited) {
    log("Have permission");
    isGranted = true;
    return isGranted;
  } else {
    log("Don't have permission");
    await requestActivityPermission().then((value) => isGranted = value);
    return isGranted;
  }
}
