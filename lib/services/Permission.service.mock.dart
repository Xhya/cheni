import 'package:cheni/services/Permission.service.dart';

class PermissionServiceMock implements PermissionService {
  Future<void> requestCameraPermissions() async {}

  Future<void> requestStoragePermissions() async {}

  Future<void> requestManageExternalStoragePermission() async {}

  Future<bool> requestPushNotificationPermission() async {
    return true;
  }
}
