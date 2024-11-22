import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService extends ChangeNotifier {
  static final PermissionService _singleton = PermissionService._internal();

  factory PermissionService() {
    return _singleton;
  }

  PermissionService._internal();

  Future<void> requestPermissions() async {
    var status = await Permission.camera.status;
    
    if (!status.isGranted) {
      await Permission.camera.request();
    }

    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }
  }
}
