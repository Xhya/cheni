import 'package:cheni/core/domains/documents/Document.service.dart';

onInitHomeScreen() async {
  await documentService.refreshDocumentList();
  await documentService.refreshStats();
}
