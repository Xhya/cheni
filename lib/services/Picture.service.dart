import 'package:cheni/services/Permission.service.dart';
import 'package:cheni/states/Picture.state.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';

final pictureService = _PictureService();

class _PictureService {
  final permissionService = PermissionService();

  takePictures() async {
    await permissionService.requestCameraPermissions();
    await permissionService.requestStoragePermissions();

    try {
      pictureState.picturePaths =
          await CunningDocumentScanner.getPictures() ?? [];
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
