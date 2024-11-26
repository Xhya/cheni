import 'package:cheni/domains/documents/document.model.dart';
import 'package:cheni/domains/documents/document.repository.dart';
import 'package:cheni/services/error.service.dart';
import 'package:cheni/states/Document.state.dart';

class DocumentService {
  final _errorService = ErrorService();
  final _documentRepository = DocumentRepository();
  final documentState = DocumentState();

  storeDocument() async {
    final documentState = DocumentState();
    if (documentState.currentDocument != null) {
      await _documentRepository.storeDocument(documentState.currentDocument!);
    }
  }

  buildCurrentDocument() async {
    final documentState = DocumentState();

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
    final documentState = DocumentState();

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
}
