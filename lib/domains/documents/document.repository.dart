import 'dart:convert';
import 'package:cheni/utils/repository.utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cheni/domains/documents/document.model.dart';

class DocumentRepository {
  final storage = const FlutterSecureStorage();

  Future<List<Document>> getDocuments() async {
    return [];
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
