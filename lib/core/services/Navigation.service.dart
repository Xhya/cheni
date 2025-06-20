import 'package:cheni/core/domains/documents/Document.service.dart';
import 'package:cheni/models/enums/DocumentCategory.enum.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cheni/routing.dart';
import 'package:cheni/screens/widgets/generic/ErrorDialog.widget.dart';

final navigationService = NavigationService();

class NavigationService extends ChangeNotifier {
  static final NavigationService _singleton = NavigationService._internal();

  factory NavigationService() {
    return _singleton;
  }

  NavigationService._internal();

  bool initialScreenSet = false;

  ScreenEnum _currentScreen = ScreenEnum.home;
  ScreenEnum get currentScreen => _currentScreen;

  List<ScreenEnum> _routesTree = [ScreenEnum.home];

  Function? pushNavigation;
  Function? showDialog;
  Function? showMenu;
  Function? showBottomSheet;

  DocumentCategoryEnum? currentDocumentCategory;

  navigateTo(ScreenEnum screen) {
    if (screen == ScreenEnum.home) {
      documentService.resetDocumentCreation();
    }
    if (screen != currentScreen) {
      _currentScreen = screen;
      _routesTree.add(screen);
      pushNavigation?.call();
    }
  }

  setInitialScreen(ScreenEnum screen) {
    if (!initialScreenSet) {
      _currentScreen = screen;
      _routesTree = [screen];
      initialScreenSet = true;
    }
  }

  popNavigation(BuildContext context) {
    _routesTree.removeLast();
    _currentScreen = _routesTree.last;
    notifyListeners();
    Navigator.of(context).popUntil((route) {
      return route.settings.name == _currentScreen.toString() ||
          route.settings.name == "/";
    });
    navigateTo(_currentScreen);
  }

  openWebUrl(String uri) async {
    final Uri url = Uri.parse(uri);
    await launchUrl(url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  openMap(String address) async {
    String googleUrl = 'https://www.google.ch/maps/place/$address';
    await openWebUrl(googleUrl);
  }

  showErrorDialog() {
    showDialog?.call(const ErrorDialogWidget());
  }
}
