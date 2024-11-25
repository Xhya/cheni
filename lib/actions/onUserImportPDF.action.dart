import 'package:cheni/actions/current.action.dart';
import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/services/Navigation.service.dart';

onUserImportPDF() async {
  currentUserAction = CurrentUserActionEnum.addingDocument;

  var fileService = FileService();
  var documentDomain = DocumentDomain();
  var navigationService = NavigationService();

  try {
    await fileService.pickPDF();
    documentDomain.currentPaths = [fileService.currentFilePath];
    documentDomain.currentType = DocumentTypeEnum.pdf;
    if (fileService.currentFilePath.isNotEmpty) {
      documentDomain.currentCreationMode = CreationModeEnum.importPdf;
      navigationService.navigateTo(ScreenEnum.createDocument);
    }
  } catch (e) {
    print(e);
  }
}
