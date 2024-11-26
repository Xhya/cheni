import 'package:cheni/domains/documents/document.model.dart';
import 'package:flutter/material.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/utils/types.dart';
import 'package:flutter/foundation.dart';

enum CreationModeEnum { scan, importPdf, importImage }

class DocumentState extends ChangeNotifier {
  static final DocumentState _singleton = DocumentState._internal();

  factory DocumentState() {
    return _singleton;
  }

  DocumentState._internal();

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

  notifyInterface() {
    notifyListeners();
  }
}
