import 'package:intl/intl.dart';

class Datetime {

  String formatString;

  Datetime(this.formatString);

  String format(DateTime date) {
    // var locale =
    //     localeService.currentLocaleEnum == LocaleEnum.fr ? "FR_fr" : "en";
    return DateFormat(formatString, "FR_fr").format(date);
  }
}
