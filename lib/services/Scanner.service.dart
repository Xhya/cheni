import 'package:cunning_document_scanner/cunning_document_scanner.dart';

class ScannerService {
  Future<List<String>?> getPictures() async {
    return CunningDocumentScanner.getPictures();
  }
}
