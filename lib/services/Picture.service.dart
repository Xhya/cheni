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

  List<Path> pictures = [];

  takePictures() async {
    await permissionService.requestCameraPermissions();
    await permissionService.requestStoragePermissions();

    try {
      pictures = await CunningDocumentScanner.getPictures() ?? [];
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
