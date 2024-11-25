import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/services/Picture.service.dart';

onSubmitNewDocument() async {
  final documentDomain = DocumentDomain();

  switch (documentDomain.currentCreationMode) {
    case CreationModeEnum.scan:
      final pictureService = PictureService();
      try {
        documentDomain.buildCurrentDocument();
        await documentDomain.storeDocument();
        await documentDomain.refreshDocumentList();
        documentDomain.resetCurrentDocument();
      } catch (e) {
        documentDomain.resetCurrentDocument();
        pictureService.resetPicture();
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
      } catch (e) {
        documentDomain.resetCurrentDocument();
        fileService.resetFile();
        print(e);
      }
    default:
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
