import 'package:cheni/domains/documents/Document.service.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';

onUserNavigateToCategory(DocumentCategoryEnum category) async {
  documentService.currentCategory = category;
  await documentService.refreshDocumentList();
  navigationService.currentDocumentCategory = category;
  navigationService.navigateTo(ScreenEnum.documentCategory);
}
