import 'package:cheni/domains/documents/document.model.dart';
import 'package:cheni/domains/documents/document.repository.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/services/Picture.service.dart';
import 'package:flutter/material.dart';

class DocumentDomain extends ChangeNotifier {
  static final DocumentDomain _singleton = DocumentDomain._internal();

  factory DocumentDomain() {
    return _singleton;
  }

  DocumentDomain._internal();

  final pictureService = PictureService();
  final documentRepository = DocumentRepository();

  DocumentCategoryEnum? currentCategory;
  String? currentName;

  Document? currentDocument;
  List<Document> currentDocumentList = [];

  List<String> documentCategories =
      DocumentCategoryEnum.values.map((it) => it.label).toList();

  storeDocument() async {
    if (currentDocument != null) {
      await documentRepository.storeDocument(currentDocument!);
    }
  }

  buildCurrentDocument() async {
    if (currentCategory != null && currentName != null) {
      currentDocument = Document.build(
        name: currentName!,
        picturePaths: pictureService.pictures,
        category: currentCategory!,
      );
    } else {
      throw Exception("Failed buildCurrentDocument");
    }
  }

  refreshDocumentList() async {
    currentDocumentList = await documentRepository.getDocuments();
    notifyListeners();
  }
}
