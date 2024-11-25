import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/services/Navigation.service.dart';

onUserImportPDF() async {
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
      // navigationService.showDialog!.call(
      //   NewDocumentWidget(
      //     state: NewDocumentWidgetState(
      //       onValidate: () async {
      //         try {
      //           await fileService.savePDF();
      //           documentDomain.buildCurrentDocument();
      //           await documentDomain.storeDocument();
      //           await documentDomain.refreshDocumentList();
      //           documentDomain.resetCurrentDocument();
      //         } catch (e) {
      //           documentDomain.resetCurrentDocument();
      //           fileService.resetFile();
      //           print(e);
      //         }
      //       },
      //       onUpdateName: (String value) {
      //         fileService.currentFileName = value;
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
    fileService.resetFile();
    print(e);
  }
}
