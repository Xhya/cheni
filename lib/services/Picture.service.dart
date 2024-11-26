import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Permission.service.dart';
import 'package:cheni/utils/types.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';

final pictureService = PictureService();

class PictureService extends ChangeNotifier {
  static final PictureService _singleton = PictureService._internal();

  factory PictureService() {
    return _singleton;
  }

  PictureService._internal();

  List<CustomPath> picturePaths = [];

  final permissionService = PermissionService();

  takePictures() async {
    await permissionService.requestCameraPermissions();
    await permissionService.requestStoragePermissions();

    try {
      picturePaths = await CunningDocumentScanner.getPictures() ?? [];
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
