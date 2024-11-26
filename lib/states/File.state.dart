import 'package:flutter/material.dart';

class FileState extends ChangeNotifier {
  static final FileState _singleton = FileState._internal();

  factory FileState() {
    return _singleton;
  }

  FileState._internal();

  String currentFilePath = "";
  String currentFileName = "";

  notifyInterface() {
    notifyListeners();
  }
}
