import 'package:cheni/core/services/Navigation.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorService extends ChangeNotifier {
  static final ErrorService _singleton = ErrorService._internal();

  factory ErrorService() {
    return _singleton;
  }

  ErrorService._internal();

  Exception? currentException;

  notifyError({required exception}) async {
    print(exception);
    currentException = exception;
    navigationService.showErrorDialog();
  }
}
