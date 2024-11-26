import 'package:cheni/actions/current.action.dart';
import 'package:cheni/domains/documents/Document.service.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/error.service.dart';

onUserSubmitNewDocument() async {
  final navigationService = NavigationService();
  final errorService = ErrorService();

  switch (documentService.currentCreationMode) {
    case CreationModeEnum.scan:
      try {
        documentService.buildCurrentDocument();
        await documentService.storeDocument();
        await documentService.refreshDocumentList();
        documentService.resetDocumentCreation();
        navigationService.navigateTo(ScreenEnum.home);
      } catch (e) {
        errorService.notifyError(exception: e);
        print(e);
      }
    case CreationModeEnum.importPdf:
      try {
        await fileService.savePDF();
        documentService.buildCurrentDocument();
        await documentService.storeDocument();
        await documentService.refreshDocumentList();
        documentService.resetDocumentCreation();
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
