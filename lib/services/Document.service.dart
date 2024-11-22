import 'package:cheni/domains/DocumentCategory.enum.dart';
import 'package:flutter/material.dart';

class DocumentService extends ChangeNotifier {
  static final DocumentService _singleton = DocumentService._internal();

  factory DocumentService() {
    return _singleton;
  }

  DocumentService._internal();

  List<String> documentCategories =
      DocumentCategoryEnum.values.map((it) => it.label).toList();
}
