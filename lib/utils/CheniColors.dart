import 'package:flutter/material.dart';

class CheniColors {
  var text = TextColors();
  var background = BackgroundColors();
  var border = BorderColors();
}

class BackgroundColors {
  var one = greyColor;
  var two = primaryColor;
}

class TextColors {
  var secondary = secondaryColor;
  var grey = greyText;
}

class BorderColors {
  var onPrimaryBackground = Colors.white;
}

Color greyColor = const Color(0xFFF7F8F7);
Color primaryColor = const Color(0xFF00340D);
Color secondaryColor = const Color(0xFF7CFF98);
Color greyText = const Color(0xFF626762);
