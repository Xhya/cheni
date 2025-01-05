import 'package:cheni/environment.dart';
import 'package:cheni/core/services/Permission.service.dart';
import 'package:cheni/core/services/Permission.service.mock.dart';
import 'package:cheni/core/services/Scanner.service.dart';
import 'package:cheni/core/services/Scanner.service.mock.dart';

get<T>() {
  var getMock = isInTestEnvironment;

  if (!getMock) {
    switch (T) {
      case PermissionService:
        return PermissionService();
      case ScannerService:
        return ScannerService();
    }
  } else {
    switch (T) {
      case PermissionService:
        return PermissionServiceMock();
      case ScannerService:
        return ScannerMock();
    }
  }
}
