import 'dart:io';

import 'package:cheni/actions/current.action.dart';
import 'package:cheni/actions/file.action.dart';
import 'package:cheni/states/Document.state.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/states/File.state.dart';

onUserImportPDF() async {
  var fileState = FileState();
  var documentState = DocumentState();
  var navigationService = NavigationService();

  currentUserAction = CurrentUserActionEnum.addingDocument;

  try {
    await pickPDF();
    documentState.currentPaths = [fileState.currentFilePath];
    documentState.currentType = DocumentTypeEnum.pdf;
    if (fileState.currentFilePath.isNotEmpty) {
      documentState.currentCreationMode = CreationModeEnum.importPdf;
      navigationService.navigateTo(ScreenEnum.createDocument);
    }
  } catch (e) {
    print(e);
  }
}
