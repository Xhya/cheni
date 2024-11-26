import 'package:cheni/actions/current.action.dart';
import 'package:cheni/domains/documents/Document.service.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Picture.service.dart';

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
