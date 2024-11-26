import 'package:cheni/actions/current.action.dart';
import 'package:cheni/domains/documents/Document.service.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';

onUserImportPDF() async {
  var navigationService = NavigationService();

  currentUserAction = CurrentUserActionEnum.addingDocument;

  try {
    await fileService.pickPDF();
    documentService.currentPaths = [fileService.currentFilePath];
    documentService.currentType = DocumentTypeEnum.pdf;
    if (fileService.currentFilePath.isNotEmpty) {
      documentService.currentCreationMode = CreationModeEnum.importPdf;
      navigationService.navigateTo(ScreenEnum.createDocument);
    }
  } catch (e) {
    print(e);
  }
}
