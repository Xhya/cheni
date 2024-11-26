import 'package:cheni/actions/current.action.dart';
import 'package:cheni/actions/document.action.dart';
import 'package:cheni/actions/file.action.dart';
import 'package:cheni/domains/documents/Document.service.dart';
import 'package:cheni/states/Document.state.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/error.service.dart';

onUserSubmitNewDocument() async {
  final documentState = DocumentState();
  final documentActions = DocumentService();
  final navigationService = NavigationService();
  final errorService = ErrorService();

  switch (documentState.currentCreationMode) {
    case CreationModeEnum.scan:
      try {
        documentActions.buildCurrentDocument();
        await documentActions.storeDocument();
        await documentActions.refreshDocumentList();
        resetDocumentCreation();
        navigationService.navigateTo(ScreenEnum.home);
      } catch (e) {
        errorService.notifyError(exception: e);
        print(e);
      }
    case CreationModeEnum.importPdf:
      try {
        await savePDF();
        documentActions.buildCurrentDocument();
        await documentActions.storeDocument();
        await documentActions.refreshDocumentList();
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
