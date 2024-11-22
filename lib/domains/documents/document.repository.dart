import 'dart:convert';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/utils/repository.utils.dart';
import 'package:cheni/utils/types.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cheni/domains/documents/document.model.dart';

var documentKey = "cheni_documents";

class DocumentRepository {
  final storage = const FlutterSecureStorage();

  Future<Document> storeDocument(Document document) async {
    await storage.write(key: documentKey, value: jsonEncode(document));
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
}
