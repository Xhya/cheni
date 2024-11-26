import 'package:cheni/actions/current.action.dart';
import 'package:cheni/domains/documents/Document.state.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/services/Navigation.service.dart';

onUserImportPDF() async {
  currentUserAction = CurrentUserActionEnum.addingDocument;

  var fileService = FileService();
  var documentState = DocumentState();
  var navigationService = NavigationService();

  try {
    await fileService.pickPDF();
    documentState.currentPaths = [fileService.currentFilePath];
    documentState.currentType = DocumentTypeEnum.pdf;
    if (fileService.currentFilePath.isNotEmpty) {
      documentState.currentCreationMode = CreationModeEnum.importPdf;
      navigationService.navigateTo(ScreenEnum.createDocument);
    }
  } catch (e) {
    print(e);
  }
}
