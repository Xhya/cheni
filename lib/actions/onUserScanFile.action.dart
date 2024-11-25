import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Picture.service.dart';

onUserScanFile() async {
  var pictureService = PictureService();
  var documentDomain = DocumentDomain();
  var navigationService = NavigationService();

  try {
    await pictureService.takePictures();
    documentDomain.currentPaths = pictureService.picturePaths;
    documentDomain.currentType = DocumentTypeEnum.picture;
    if (pictureService.picturePaths.isNotEmpty) {
      documentDomain.currentCreationMode = CreationModeEnum.scan;
      navigationService.navigateTo(ScreenEnum.createDocument);
      // navigationService.showDialog!.call(
      //   NewDocumentWidget(
      //     state: NewDocumentWidgetState(
      //       onValidate: () async {
      //         try {
      //           documentDomain.buildCurrentDocument();
      //           await documentDomain.storeDocument();
      //           await documentDomain.refreshDocumentList();
      //           documentDomain.resetCurrentDocument();
      //         } catch (e) {
      //           documentDomain.resetCurrentDocument();
      //           pictureService.resetPicture();
      //           print(e);
      //         }
      //       },
      //       onUpdateName: (String value) {
      //         documentDomain.currentName = value;
      //       },
      //       onUpdateCategory: (DocumentCategoryEnum value) {
      //         documentDomain.currentCategory = value;
      //       },
      //     ),
      //   ),
      // );
    }
  } catch (e) {
    documentDomain.resetCurrentDocument();
    pictureService.resetPicture();
    print(e);
  }
}
