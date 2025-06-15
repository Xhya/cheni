import 'package:cheni/core/actions/onUserClickHomeScreenBottomButton.action.dart';
import 'package:cheni/core/actions/onUserScanFile.action.dart';
import 'package:cheni/core/domains/documents/Document.service.dart';
import 'package:cheni/models/enums/DocumentType.enum.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/core/services/Navigation.service.dart';
import 'package:cheni/core/services/Translation.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await TranslationService().init();
    navigationService.showMenu ??=
        ({required List<PopupMenuEntry<void>> items}) {};
  });

  test('take a picture and store it', () async {
    // Je suis sur la home page
    navigationService.navigateTo(ScreenEnum.home);
    // Je clique sur le bouton ajouter
    await onUserClickHomeScreenBottomButton();
    // Le menu s'ouvre
    // verify(navigationService.showMenu!(items: any)).called(1);
    // Je clique pour prendre une photo
    await onUserScanFile();
    // Le document contient des paths
    expect(false, documentService.currentPaths.isEmpty);
    // Le document contient un type picture
    expect(DocumentTypeEnum.picture, documentService.currentType);
    // Et je navigue jusqu'à la création de documents
    expect(ScreenEnum.createDocument, navigationService.currentScreen);
  });
}
