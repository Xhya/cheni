import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cheni/services/Navigation.service.dart';

class ErrorService extends ChangeNotifier {
  static final ErrorService _singleton = ErrorService._internal();

  factory ErrorService() {
    return _singleton;
  }

  ErrorService._internal();

  final _navigationService = NavigationService();

  Exception? currentException;

  notifyError({required exception}) async {
    print(exception);
    currentException = exception;
    _navigationService.showErrorDialog();
  }
}
