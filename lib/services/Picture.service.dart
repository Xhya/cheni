import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Permission.service.dart';
import 'package:cheni/utils/types.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';

class PictureService extends ChangeNotifier {
  static final PictureService _singleton = PictureService._internal();

  factory PictureService() {
    return _singleton;
  }

  PictureService._internal();

  final permissionService = PermissionService();

  final _navigationService = NavigationService();

  Path? currentPicturePath;
  List<Path> picturePaths = [];

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

  viewPicture(Path path) {
    currentPicturePath = path;
    _navigationService.navigateTo(ScreenEnum.imageViewer);
  }
}
