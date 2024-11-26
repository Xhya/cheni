import 'package:cheni/domains/documents/Document.service.dart';
import 'package:cheni/states/Document.state.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';

navigateToCategory(DocumentCategoryEnum category) async {
  var navigationService = NavigationService();
  var documentState = DocumentState();
  var documentDomain = DocumentService();
  documentState.currentCategory = category;
  await documentDomain.refreshDocumentList();
  navigationService.currentDocumentCategory = category;
  navigationService.navigateTo(ScreenEnum.documentCategory);
}
