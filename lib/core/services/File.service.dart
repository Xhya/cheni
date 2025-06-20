import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

final fileService = _FileService();

class _FileService extends ChangeNotifier {
  static final _FileService _singleton = _FileService._internal();

  factory _FileService() {
    return _singleton;
  }

  _FileService._internal();

  String currentFilePath = "";
  String currentFileName = "";

  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result?.files.single.path != null) {
      currentFilePath = result!.files.single.path!;
    } else {
      throw Exception("Failed pickPDF");
    }
  }

  Future<void> savePDF() async {
    if (currentFilePath.isNotEmpty && currentFileName.isNotEmpty) {
      final directory = await getApplicationDocumentsDirectory();
      final targetPath = '${directory.path}/$currentFileName';
      final sourceFile = File(currentFilePath);
      final targetFile = File(targetPath);

      await sourceFile.copy(targetPath);
      print('Fichier sauvegardé à : $targetPath');
    } else {
      throw Exception("Failed savePDF");
    }
  }

  openLocalPdfInBrowser(String filePath) async {
    if (!File(filePath).existsSync()) {
      throw "File does not exist at $filePath";
    }
    try {
      await OpenFilex.open(filePath);
    } catch (e) {
      print(e);
      throw "Failed openLocalPdfInBrowser";
    }
  }

  resetFile() {
    currentFilePath = "";
    currentFileName = "";
    notifyListeners();
  }
}
