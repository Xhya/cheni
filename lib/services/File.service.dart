import 'dart:io';

import 'package:cheni/states/File.state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

final fileService = _FileService();

class _FileService {
  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result?.files.single.path != null) {
      fileState.currentFilePath = result!.files.single.path!;
    } else {
      throw Exception("Failed pickPDF");
    }
  }

  Future<void> savePDF() async {
    if (fileState.currentFilePath.isNotEmpty &&
        fileState.currentFileName.isNotEmpty) {
      final directory = await getApplicationDocumentsDirectory();
      final targetPath = '${directory.path}/${fileState.currentFileName}';
      final sourceFile = File(fileState.currentFilePath);
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
    fileState.currentFilePath = "";
    fileState.currentFileName = "";
    fileState.notifyInterface();
  }
}
