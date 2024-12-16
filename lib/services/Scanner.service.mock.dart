import 'package:cheni/services/Scanner.service.dart';

class ScannerMock implements ScannerService {
  Future<List<String>?> getPictures() async {
    return ["path1", "path2"];
  }
}
