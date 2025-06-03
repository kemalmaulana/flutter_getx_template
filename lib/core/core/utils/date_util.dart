import 'package:intl/intl.dart';

class DateUtil {
  static const dateFormatMonthYear = 'MMM yyyy';
  static const dateFormatStandart = 'd MMM yyyy';
  static const dateFormatYearOnly = 'yyyy';
  static const dateFormatMonthDayYear = 'MMM d, yyyy';
  static const dateFormatHmMonthDayYear = 'hh:mm in MMM d, yyyy';

  static String dateToString(String value,
      {String formatDate = dateFormatStandart}) {
    return DateFormat(formatDate).format(DateTime.parse(value));
  }

  static String dateDifference(String date1, String date2) {
    final int inDays = DateTime.parse(date2).difference(DateTime.parse(date1)).inDays;

    final int years = (inDays / 365).floor();
    final int months = ((inDays - years * 365) / 30).floor();
    if (years == 0 && months == 0) return '';
    return "(${years != 0 ? '$years Year' : ''}${years != 0 && months != 0 ? ' ' : ''}${months != 0 ? '$months Month' : ''})";
  }

  static String multiDateToString(String date1, {String? date2}) {
    return "${dateToString(date1, formatDate: dateFormatMonthYear)} - ${(date2 == null)
            ? 'present ${dateDifference(date1, DateTime.now().toString())}'
            : "${dateToString(date2, formatDate: DateUtil.dateFormatMonthYear)} ${dateDifference(date1, date2)}"}";
  }
}
