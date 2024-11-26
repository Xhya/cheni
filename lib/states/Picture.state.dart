import 'package:cheni/utils/types.dart';
import 'package:flutter/material.dart';

final pictureState = PictureState();

class PictureState extends ChangeNotifier {
  static final PictureState _singleton = PictureState._internal();

  factory PictureState() {
    return _singleton;
  }

  PictureState._internal();

  List<CustomPath> picturePaths = [];

  notifyInterface() {
    notifyListeners();
  }
}
