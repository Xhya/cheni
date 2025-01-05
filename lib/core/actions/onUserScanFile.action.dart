import 'package:cheni/core/actions/current.action.dart';
import 'package:cheni/core/domains/documents/Document.service.dart';
import 'package:cheni/models/enums/DocumentType.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/core/services/Navigation.service.dart';
import 'package:cheni/core/services/Picture.service.dart';

onUserScanFile() async {
  currentUserAction = CurrentUserActionEnum.addingDocument;

  try {
    await pictureService.takePictures();
    documentService.currentPaths = pictureService.picturePaths;
    documentService.currentType = DocumentTypeEnum.picture;
    if (pictureService.picturePaths.isNotEmpty) {
      documentService.currentCreationMode = CreationModeEnum.scan;
      navigationService.navigateTo(ScreenEnum.createDocument);
    }
  } catch (e) {
    documentService.resetCurrentDocument();
    pictureService.resetPicture();
    print(e);
  }
}
