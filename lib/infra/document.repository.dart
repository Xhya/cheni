import 'dart:convert';
import 'package:cheni/models/enums/DocumentCategory.enum.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cheni/models/document.model.dart';

var documentKey = "cheni_documents";

class DocumentRepository {
  final storage = const FlutterSecureStorage();

  Future<Document> storeDocument(Document document) async {
    var documents = await getDocuments();
    documents.add(document);

    List<Map> documentsJson = documents.map((it) => it.toJson()).toList();
    await storage.write(key: documentKey, value: jsonEncode(documentsJson));
    return document;
  }

  Future<List<Document>> getDocuments() async {
    var documentRaws = await storage.read(key: documentKey) ?? "[]";
    return jsonDecode(documentRaws)
        .map<Document>((e) => Document.fromJson(e))
        .toList();
  }

  Future<Map<dynamic, int>> getStats() async {
    var documentRaws = await storage.read(key: documentKey) ?? "[]";
    var documents = jsonDecode(documentRaws)
        .map<Document>((e) => Document.fromJson(e))
        .toList();

    Map<dynamic, int> counts = DocumentCategoryEnum.values.fold({}, (prev, curr) {
      var count = documents.where((doc) => doc.category == curr).length;
      return {
        ...prev,
        curr.label: count,
      };
    });

    return counts;
  }
}
