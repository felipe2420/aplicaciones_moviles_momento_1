import 'package:intl/intl.dart';

class StringUtils {
  static String formatNumber({required double value}) {
    var formatter = NumberFormat.decimalPattern("en_us");
    return formatter.format(value);
  }
}