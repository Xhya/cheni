import 'package:cheni/core/services/Scanner.service.dart';

class ScannerMock implements ScannerService {
  Future<List<String>?> getPictures() async {
    return ["path1", "path2"];
  }
}
