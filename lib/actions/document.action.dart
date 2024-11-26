import 'package:cheni/actions/current.action.dart';
import 'package:cheni/actions/file.action.dart';
import 'package:cheni/actions/picture.action.dart';
import 'package:cheni/states/Document.state.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/states/File.state.dart';

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

onUpdateDocumentName(String value) {
  var documentState = DocumentState();
  if (documentState.currentCreationMode == CreationModeEnum.importPdf) {
    fileState.currentFileName = value;
  }
  documentState.currentName = value;
  documentState.notifyInterface();
}

resetDocumentCreation() {
  currentUserAction = CurrentUserActionEnum.navigating;
  resetCurrentDocument();
  resetFile();
  resetPicture();
}
