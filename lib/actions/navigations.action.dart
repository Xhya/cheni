import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';

navigateToCategory(DocumentCategoryEnum category) async {
  var navigationService = NavigationService();
  var documentDomain = DocumentDomain();
  documentDomain.currentCategory = category;
  await documentDomain.refreshDocumentList();
  navigationService.currentDocumentCategory = category;
  navigationService.navigateTo(ScreenEnum.documentCategory);
}
