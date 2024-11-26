import 'package:cheni/domains/documents/document.model.dart';
import 'package:cheni/domains/documents/document.repository.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/services/error.service.dart';
import 'package:cheni/utils/types.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum CreationModeEnum { scan, importPdf, importImage }

class DocumentDomain extends ChangeNotifier {
  static final DocumentDomain _singleton = DocumentDomain._internal();

  factory DocumentDomain() {
    return _singleton;
  }

  DocumentDomain._internal();

  final _errorService = ErrorService();
  final _documentRepository = DocumentRepository();

  CreationModeEnum? currentCreationMode;
  DocumentCategoryEnum? currentCategory;
  String? currentName;
  DocumentTypeEnum? currentType;

  Document? currentDocument;
  List<Document> currentDocumentList = [];
  List<CustomPath> currentPaths = [];

  List<String> documentCategories =
      DocumentCategoryEnum.values.map((it) => it.label).toList();
  Map<dynamic, int> categoriesCounts = {};
  int get documentCount => categoriesCounts.values.fold(0, (prev, curr) => prev + curr);

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

  onUpdateDocumentName(String value) {
    currentName = value;
    notifyListeners();
  }

  onUpdateDocumentCategory(DocumentCategoryEnum value) {
    currentCategory = value;
    notifyListeners();
  }
}
