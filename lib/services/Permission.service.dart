import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService extends ChangeNotifier {
  static final PermissionService _singleton = PermissionService._internal();

  factory PermissionService() {
    return _singleton;
  }

  PermissionService._internal();

  Future<void> requestCameraPermissions() async {
    var status = await Permission.camera.status;

    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  Future<void> requestStoragePermissions() async {
    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<void> requestManageExternalStoragePermission() async {
    if (await Permission.manageExternalStorage.request().isGranted) {
      print('Permission accordée pour accéder à tous les fichiers');
    } else {
      print('Permission refusée');
    }
  }

  Future<bool> requestPushNotificationPermission() async {
    final PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      return false;
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
    return false;
  }
}
