import 'package:cheni/actions/current.action.dart';
import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Picture.service.dart';

onSubmitNewDocument() async {
  final documentDomain = DocumentDomain();
  final navigationService = NavigationService();

  switch (documentDomain.currentCreationMode) {
    case CreationModeEnum.scan:
      final pictureService = PictureService();
      try {
        documentDomain.buildCurrentDocument();
        await documentDomain.storeDocument();
        await documentDomain.refreshDocumentList();
        documentDomain.resetCurrentDocument();
        navigationService.navigateTo(ScreenEnum.home);
        currentUserAction = CurrentUserActionEnum.navigating;
      } catch (e) {
        documentDomain.resetCurrentDocument();
        pictureService.resetPicture();
        currentUserAction = CurrentUserActionEnum.navigating;
        print(e);
      }
    case CreationModeEnum.importPdf:
      final fileService = FileService();
      try {
        await fileService.savePDF();
        documentDomain.buildCurrentDocument();
        await documentDomain.storeDocument();
        await documentDomain.refreshDocumentList();
        documentDomain.resetCurrentDocument();
        navigationService.navigateTo(ScreenEnum.home);
        currentUserAction = CurrentUserActionEnum.navigating;
      } catch (e) {
        documentDomain.resetCurrentDocument();
        fileService.resetFile();
        currentUserAction = CurrentUserActionEnum.navigating;
        print(e);
      }
    default:
      currentUserAction = CurrentUserActionEnum.navigating;
      print("No switch");
  }
}

onUpdateDocumentName(String value) {
  final documentDomain = DocumentDomain();
  documentDomain.currentName = value;
}

onUpdateDocumentCategory(DocumentCategoryEnum value) {
  final documentDomain = DocumentDomain();
  documentDomain.currentCategory = value;
}
