import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cheni/domains/documents/document.model.dart';

var documentKey = "cheni_documents";

class DocumentRepository {
  final storage = const FlutterSecureStorage();

  Future<Document> storeDocument(Document document) async {
    var documents = await getDocuments();
    documents.add(document);

    List<Map> documentsJson = documents.map((it) => it.toJson()).toList();
    await storage.write(key: documentKey, value: jsonEncode(documentsJson));
    return document;
    // try {
    //   var url = Uri.parse('$apiUrl/api/v1/documents');
    //   var response = await http.get(
    //     url,
    //     headers: await headersWithToken(),
    //   );
    //   if (response.statusCode == 200) {
    //     var jsonResponse = jsonDecode(response.body);

    //     return jsonResponse['data']
    //         .map<Document>((e) => Document.fromJson(e))
    //         .toList();
    //   } else {
    //     throw Exception('Failed');
    //   }
    // } catch (e) {
    //   throw Exception(e);
    // }
  }

  Future<List<Document>> getDocuments() async {
    var documentRaws = await storage.read(key: documentKey) ?? "[]";
    print(documentRaws);
    return jsonDecode(documentRaws)
        .map<Document>((e) => Document.fromJson(e))
        .toList();
  }
}
