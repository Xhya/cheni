import 'dart:convert';
import 'package:cheni/services/locale.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TranslationService extends ChangeNotifier {
  static final TranslationService _singleton = TranslationService._internal();

  factory TranslationService() {
    return _singleton;
  }

  TranslationService._internal();

  final localeService = LocaleService();

  var textFR = {};

  init() async {
    var input = await rootBundle.loadString("assets/lang/fr.json");
    textFR = jsonDecode(input);
  }

  String t(String key) {
    return textFR[key];
  }
}
