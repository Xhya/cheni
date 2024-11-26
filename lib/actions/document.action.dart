import 'package:cheni/domains/documents/Document.state.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';

resetCurrentDocument() {
  var documentState = DocumentState();
  documentState.currentCategory = null;
  documentState.currentName = null;
  documentState.currentDocument = null;
  documentState.notifyInterface();
}

onUpdateDocumentCategory(DocumentCategoryEnum value) {
  var documentState = DocumentState();
  documentState.currentCategory = value;
  documentState.notifyInterface();
}
