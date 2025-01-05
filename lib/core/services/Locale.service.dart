import 'package:cheni/models/enums/Locale.enum.dart';
import 'package:flutter/material.dart';

class LocaleService extends ChangeNotifier {
  static final LocaleService _singleton = LocaleService._internal();

  factory LocaleService() {
    return _singleton;
  }

  LocaleService._internal();

  LocaleEnum currentLocaleEnum = LocaleEnum.fr;

  // refreshLocale() async {
  //   var locale = await settingsRepository.getLocale();
  //   currentLocaleEnum = locale ?? LocaleEnum.fr;
  //   notifyListeners();
  // }

  // setLocale(LocaleEnum locale) async {
  //   await settingsRepository.setLocale(locale);
  //   currentLocaleEnum = locale;
  //   notifyListeners();
  // }

  toggleLocale() async {
    if (currentLocaleEnum == LocaleEnum.fr) {
      currentLocaleEnum = LocaleEnum.en;
    } else {
      currentLocaleEnum = LocaleEnum.fr;
    }
    notifyListeners();
  }
}
