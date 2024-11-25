import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';

navigateToCategory(DocumentCategoryEnum category) {
  var navigationService = NavigationService();
  navigationService.currentDocumentCategory = category;
  navigationService.navigateTo(ScreenEnum.documentCategory);
}
