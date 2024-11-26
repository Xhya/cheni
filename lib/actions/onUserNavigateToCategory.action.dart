import 'package:cheni/domains/documents/Document.service.dart';
import 'package:cheni/states/Document.state.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';

onUserNavigateToCategory(DocumentCategoryEnum category) async {
  var navigationService = NavigationService();
  documentState.currentCategory = category;
  await documentService.refreshDocumentList();
  navigationService.currentDocumentCategory = category;
  navigationService.navigateTo(ScreenEnum.documentCategory);
}
