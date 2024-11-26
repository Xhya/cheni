import 'package:cheni/actions/current.action.dart';
import 'package:cheni/domains/documents/document.model.dart';
import 'package:cheni/domains/documents/document.repository.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/services/Picture.service.dart';
import 'package:cheni/services/error.service.dart';
import 'package:cheni/states/Document.state.dart';
import 'package:cheni/states/File.state.dart';

var documentService = _DocumentService();

class _DocumentService {
  final _errorService = ErrorService();
  final _documentRepository = DocumentRepository();

  storeDocument() async {
    if (documentState.currentDocument != null) {
      await _documentRepository.storeDocument(documentState.currentDocument!);
    }
  }

  buildCurrentDocument() async {
    if (documentState.currentCategory != null &&
        documentState.currentName != null &&
        documentState.currentType != null &&
        documentState.currentPaths.isNotEmpty) {
      documentState.currentDocument = Document.build(
        name: documentState.currentName!,
        paths: documentState.currentPaths,
        category: documentState.currentCategory!,
        type: documentState.currentType!,
      );
    } else {
      throw Exception("Failed buildCurrentDocument");
    }
  }

  refreshDocumentList() async {
    try {
      documentState.currentDocumentList =
          await _documentRepository.getDocuments();
      if (documentState.currentCategory != null) {
        documentState.currentDocumentList = documentState.currentDocumentList
            .where((it) => it.category == documentState.currentCategory)
            .toList();
      }
      documentState.notifyInterface();
    } catch (e) {
      _errorService.notifyError(exception: e);
    }
  }

  refreshStats() async {
    try {
      documentState.categoriesCounts = await _documentRepository.getStats();
      documentState.notifyInterface();
    } catch (e) {
      _errorService.notifyError(exception: e);
    }
  }

  resetCurrentDocument() {
    documentState.currentCategory = null;
    documentState.currentName = null;
    documentState.currentDocument = null;
    documentState.notifyInterface();
  }

  onUpdateDocumentCategory(DocumentCategoryEnum value) {
    documentState.currentCategory = value;
    documentState.notifyInterface();
  }

  onUpdateDocumentName(String value) {
    if (documentState.currentCreationMode == CreationModeEnum.importPdf) {
      fileState.currentFileName = value;
    }
    documentState.currentName = value;
    documentState.notifyInterface();
  }

  resetDocumentCreation() {
    currentUserAction = CurrentUserActionEnum.navigating;
    resetCurrentDocument();
    fileService.resetFile();
    pictureService.resetPicture();
  }
}
