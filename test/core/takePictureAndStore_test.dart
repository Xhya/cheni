import 'package:cheni/actions/onUserClickHomeScreenBottomButton.action.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Translation.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await TranslationService().init();
    navigationService.showMenu ??=
        ({required List<PopupMenuEntry<void>> items}) {};
  });

  //group("Menu screen -", () {
  test('take a picture and store it', () async {
    // Je suis sur la home page
    navigationService.navigateTo(ScreenEnum.home);
    // Je clique sur le bouton ajouter
    onUserClickHomeScreenBottomButton();
    // Le menu s'ouvre
    verify(navigationService.showMenu!.call(items: any)).called(1);
//    navigationService
    // .showMenu
    // .
    // L'appareil photo s'ouvre
    // Je peux prendre une ou plusieurs photos
    // Quand je termine les photos sont stockés dans la catégorie

    // QUAND
    // expect(navigation.currentScreen, ScreenEnum.threads);
    // expect(navigation.currentIndex, 1);
  });
  //});
}
