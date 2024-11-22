import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:flutter/material.dart';

class DocumentDomain extends ChangeNotifier {
  static final DocumentDomain _singleton = DocumentDomain._internal();

  factory DocumentDomain() {
    return _singleton;
  }

  DocumentDomain._internal();

  List<String> documentCategories =
      DocumentCategoryEnum.values.map((it) => it.label).toList();
}
