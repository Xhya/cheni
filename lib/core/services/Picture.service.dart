import 'package:cheni/core/services/Navigation.service.dart';
import 'package:cheni/core/services/Permission.service.dart';
import 'package:cheni/core/services/Scanner.service.dart';
import 'package:cheni/provider.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/utils/types.dart';
import 'package:flutter/material.dart';

final pictureService = PictureService();

class PictureService extends ChangeNotifier {
  static final PictureService _singleton = PictureService._internal();

  factory PictureService() {
    return _singleton;
  }

  PictureService._internal();

  List<CustomPath> picturePaths = [];

  final permissionService = get<PermissionService>();
  final cunningDocumentScanner = get<ScannerService>();

  takePictures() async {
    await permissionService.requestCameraPermissions();
    await permissionService.requestStoragePermissions();

    try {
      picturePaths = await cunningDocumentScanner.getPictures() ?? [];
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  viewPictures(List<CustomPath> paths) {
    picturePaths = paths;
    navigationService.navigateTo(ScreenEnum.imageViewer);
  }

  resetPicture() {
    picturePaths = [];
    notifyListeners();
  }
}
