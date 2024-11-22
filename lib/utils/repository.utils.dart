import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cheni/environment.dart';

final apiUrl = environment["API_TAMAM_URL"];

var headers = {
  "Content-Type": "application/json",
  'Accept': 'application/json',
};

headersWithToken() async {
  const storage = FlutterSecureStorage();
  var token = await storage.read(key: "cheni_token");
  return {
    "Content-Type": "application/json",
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}
