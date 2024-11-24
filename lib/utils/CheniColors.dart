import 'package:flutter/material.dart';

class CheniColors {
  var text = TextColors();
  var background = BackgroundColors();
  var border = BorderColors();
}

class BackgroundColors {
  var one = greyColor;
  var two = primaryColor;
  var three = secondaryColorLight;
  var four = greyDarkColor;
  var five = secondaryColor;
}

class TextColors {
  var secondary = secondaryColor;
  var grey = greyText;
  var black = blackText;
}

class BorderColors {
  var black = Colors.black;
}

Color greyColor = const Color(0xFFF7F8F7);
Color greyDarkColor = const Color(0xFFEAEBEA);
Color primaryColor = const Color(0xFF00340D);
Color secondaryColor = const Color(0xFF7CFF98);
Color greyText = const Color(0xFF626762);
Color blackText = const Color(0xFF282928);
Color secondaryColorLight = const Color(0xFFD7FFDF);
