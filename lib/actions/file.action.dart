import 'package:cheni/services/File.service.dart';
import 'package:cheni/states/File.state.dart';

final fileState = FileState();

pickPDF() async {
  var fileService = FileService();
  await fileService.pickPDF();
}

savePDF() async {
  var fileService = FileService();
  fileService.savePDF();
}

resetFile() {
  fileState.currentFilePath = "";
  fileState.currentFileName = "";
  fileState.notifyInterface();
}

openLocalPdfInBrowser(String filePath) {
  var fileService = FileService();
  fileService.openLocalPdfInBrowser(filePath);
}
