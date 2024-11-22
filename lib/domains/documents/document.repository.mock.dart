import 'package:cheni/domains/documents/document.model.dart';
import 'package:cheni/domains/documents/document.repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DocumentRepositoryMock implements DocumentRepository {
  @override
  Future<List<Document>> getDocuments() {
    // TODO: implement getDocuments
    throw UnimplementedError();
  }

  @override
  // TODO: implement storage
  FlutterSecureStorage get storage => throw UnimplementedError();
}
