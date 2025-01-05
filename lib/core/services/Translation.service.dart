import 'dart:convert';
import 'package:cheni/core/services/Locale.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String t(String key) {
  return TranslationService().textFR[key];
}

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
}

