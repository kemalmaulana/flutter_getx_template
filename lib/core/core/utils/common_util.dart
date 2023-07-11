import 'package:intl/intl.dart';

class CommonUtil {
  static String convertToCurrency(final int number) {
    final oCcy = NumberFormat("#,###");
    return "Rp${oCcy.format(number).replaceAll(',', '.')}";
  }
}

extension StringExtension on String {
  String capitalizeFirst() {
    if (isEmpty) {
      return "";
    } else if (length == 1) {
      return this[0].toUpperCase();
    }
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String? capitalizeFirstofEach() {
    if (split(" ").isEmpty) return null;
    return split(" ").map((str) => str.capitalizeFirst()).join(" ");
  }
}
