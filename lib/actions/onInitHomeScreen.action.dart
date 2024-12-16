import 'package:cheni/domains/documents/Document.service.dart';

onInitHomeScreen() async {
  await documentService.refreshDocumentList();
  await documentService.refreshStats();
}
