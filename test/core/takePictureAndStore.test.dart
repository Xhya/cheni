import 'package:cheni/routing.dart';
import 'package:cheni/screens/home.viewmodel.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var homeViewModel = HomeViewModel();

  setUp(() {});

  takePictureAndStore() async {
    // Je suis sur la home page
    navigationService.navigateTo(ScreenEnum.home);
    // Je clique sur le bouton ajouter
    homeViewModel.bottomAddButton.onClick();
    // L'appareil photo s'ouvre
    // Je peux prendre une ou plusieurs photos
    // Quand je termine les photos sont stockés dans la catégorie

    // QUAND

  }
}
