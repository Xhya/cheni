import 'package:cheni/actions/current.action.dart';
import 'package:cheni/domains/documents/Document.service.dart';
import 'package:cheni/states/Document.state.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Picture.service.dart';
import 'package:cheni/states/Picture.state.dart';

onUserScanFile() async {
  currentUserAction = CurrentUserActionEnum.addingDocument;

  var navigationService = NavigationService();

  try {
    await pictureService.takePictures();
    documentState.currentPaths = pictureState.picturePaths;
    documentState.currentType = DocumentTypeEnum.picture;
    if (pictureState.picturePaths.isNotEmpty) {
      documentState.currentCreationMode = CreationModeEnum.scan;
      navigationService.navigateTo(ScreenEnum.createDocument);
    }
  } catch (e) {
    documentService.resetCurrentDocument();
    pictureService.resetPicture();
    print(e);
  }
}
