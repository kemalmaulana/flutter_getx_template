import 'package:intl/intl.dart';

extension IntExtension on int {
  String toCurrencyStr() {
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
    return formatCurrency.format(this);
  }
}
