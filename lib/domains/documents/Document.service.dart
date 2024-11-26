import 'package:cheni/actions/current.action.dart';
import 'package:cheni/domains/documents/document.model.dart';
import 'package:cheni/domains/documents/document.repository.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/services/Picture.service.dart';
import 'package:cheni/services/error.service.dart';
import 'package:cheni/utils/types.dart';
import 'package:flutter/material.dart';

enum CreationModeEnum { scan, importPdf, importImage }

var documentService = DocumentService();

class DocumentService extends ChangeNotifier {
  static final DocumentService _singleton = DocumentService._internal();

  factory DocumentService() {
    return _singleton;
  }

  DocumentService._internal();

  CreationModeEnum? currentCreationMode;
  DocumentCategoryEnum? currentCategory;
  String? currentName;
  DocumentTypeEnum? currentType;

  List<Document> currentDocumentList = [];
  Document? currentDocument;
  List<CustomPath> currentPaths = [];

  List<String> documentCategories =
      DocumentCategoryEnum.values.map((it) => it.label).toList();
  Map<dynamic, int> categoriesCounts = {};
  int get documentCount =>
      categoriesCounts.values.fold(0, (prev, curr) => prev + curr);

  final _errorService = ErrorService();
  final _documentRepository = DocumentRepository();

  storeDocument() async {
    if (currentDocument != null) {
      await _documentRepository.storeDocument(currentDocument!);
    }
  }

  buildCurrentDocument() async {
    if (currentCategory != null &&
        currentName != null &&
        currentType != null &&
        currentPaths.isNotEmpty) {
      currentDocument = Document.build(
        name: currentName!,
        paths: currentPaths,
        category: currentCategory!,
        type: currentType!,
      );
    } else {
      throw Exception("Failed buildCurrentDocument");
    }
  }

  refreshDocumentList() async {
    try {
      currentDocumentList = await _documentRepository.getDocuments();
      if (currentCategory != null) {
        currentDocumentList = currentDocumentList
            .where((it) => it.category == currentCategory)
            .toList();
      }
      notifyListeners();
    } catch (e) {
      _errorService.notifyError(exception: e);
    }
  }

  refreshStats() async {
    try {
      categoriesCounts = await _documentRepository.getStats();
      notifyListeners();
    } catch (e) {
      _errorService.notifyError(exception: e);
    }
  }

  resetCurrentDocument() {
    currentCategory = null;
    currentName = null;
    currentDocument = null;
    notifyListeners();
  }

  onUpdateDocumentCategory(DocumentCategoryEnum value) {
    currentCategory = value;
    notifyListeners();
  }

  onUpdateDocumentName(String value) {
    if (currentCreationMode == CreationModeEnum.importPdf) {
      fileService.currentFileName = value;
    }
    currentName = value;
    notifyListeners();
  }

  resetDocumentCreation() {
    currentUserAction = CurrentUserActionEnum.navigating;
    resetCurrentDocument();
    fileService.resetFile();
    pictureService.resetPicture();
  }
}
