import 'package:cheni/domains/documents/document.model.dart';
import 'package:cheni/domains/documents/document.repository.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/services/Picture.service.dart';
import 'package:cheni/services/error.service.dart';
import 'package:cheni/utils/types.dart';
import 'package:flutter/material.dart';

class DocumentDomain extends ChangeNotifier {
  static final DocumentDomain _singleton = DocumentDomain._internal();

  factory DocumentDomain() {
    return _singleton;
  }

  DocumentDomain._internal();

  final _errorService = ErrorService();
  final _pictureService = PictureService();
  final _documentRepository = DocumentRepository();

  DocumentCategoryEnum? currentCategory;
  String? currentName;
  DocumentTypeEnum? currentType;

  Document? currentDocument;
  List<Document> currentDocumentList = [];
  List<CustomPath> currentPaths = [];

  List<String> documentCategories =
      DocumentCategoryEnum.values.map((it) => it.label).toList();

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
      notifyListeners();
    } catch (e) {
      _errorService.notifyError(exception: e);
    }
  }

  resetCurrentDocument() {
    currentCategory = null;
    currentName = null;
    currentDocument = null;
  }
}
