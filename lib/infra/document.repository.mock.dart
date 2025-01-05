import 'package:cheni/models/document.model.dart';
import 'package:cheni/infra/document.repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DocumentRepositoryMock implements DocumentRepository {
  @override
  FlutterSecureStorage get storage => throw UnimplementedError();
  
  @override
  Future<Document> storeDocument(Document document) {
    // TODO: implement storeDocument
    throw UnimplementedError();
  }
  
  @override
  Future<List<Document>> getDocuments() {
    // TODO: implement getDocuments
    throw UnimplementedError();
  }
  
  @override
  Future<Map<dynamic, int>> getStats() {
    // TODO: implement getStats
    throw UnimplementedError();
  }

}
