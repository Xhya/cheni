import 'package:cheni/services/File.service.dart';
import 'package:cheni/states/File.state.dart';

pickPDF() async {
  await fileService.pickPDF();
}

savePDF() async {
  fileService.savePDF();
}

resetFile() {
  fileState.currentFilePath = "";
  fileState.currentFileName = "";
  fileState.notifyInterface();
}

openLocalPdfInBrowser(String filePath) {
  fileService.openLocalPdfInBrowser(filePath);
}
