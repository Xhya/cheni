import 'package:cheni/core/domains/documents/Document.service.dart';
import 'package:cheni/models/enums/DocumentCategory.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/core/services/Navigation.service.dart';

onUserNavigateToCategory(DocumentCategoryEnum category) async {
  documentService.currentCategory = category;
  await documentService.refreshDocumentList();
  navigationService.currentDocumentCategory = category;
  navigationService.navigateTo(ScreenEnum.documentCategory);
}
