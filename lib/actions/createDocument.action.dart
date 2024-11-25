import 'package:cheni/actions/current.action.dart';
import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Picture.service.dart';
import 'package:cheni/services/error.service.dart';

onSubmitNewDocument() async {
  final documentDomain = DocumentDomain();
  final navigationService = NavigationService();
  final errorService = ErrorService();

  switch (documentDomain.currentCreationMode) {
    case CreationModeEnum.scan:
      try {
        documentDomain.buildCurrentDocument();
        await documentDomain.storeDocument();
        await documentDomain.refreshDocumentList();
        resetDocumentCreation();
        navigationService.navigateTo(ScreenEnum.home);
      } catch (e) {
        errorService.notifyError(exception: e);
        print(e);
      }
    case CreationModeEnum.importPdf:
      final fileService = FileService();
      try {
        await fileService.savePDF();
        documentDomain.buildCurrentDocument();
        await documentDomain.storeDocument();
        await documentDomain.refreshDocumentList();
        resetDocumentCreation();
        navigationService.navigateTo(ScreenEnum.home);
      } catch (e) {
        errorService.notifyError(exception: e);
        print(e);
      }
    default:
      currentUserAction = CurrentUserActionEnum.navigating;
      print("No switch");
  }
}

onUpdateDocumentName(String value) {
  var documentDomain = DocumentDomain();
  if (documentDomain.currentCreationMode == CreationModeEnum.importPdf) {
    FileService().currentFileName = value;
  }
  documentDomain.onUpdateDocumentName(value);
}

resetDocumentCreation() {
  currentUserAction = CurrentUserActionEnum.navigating;
  DocumentDomain().resetCurrentDocument();
  FileService().resetFile();
  PictureService().resetPicture();
}
