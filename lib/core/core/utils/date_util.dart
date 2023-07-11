import 'package:intl/intl.dart';

class DateUtil {
  static const DATE_FORMAT_MONTHYEAR = "MMM yyyy";
  static const DATE_FORMAT_STANDART = "d MMM yyyy";
  static const DATE_FORMAT_YEAR_ONLY = "yyyy";
  static const DATE_FORMAT_MONTHDAYYEAR = "MMM d, yyyy";
  static const DATE_FORMAT_HMMONTHDAYYEAR = "hh:mm in MMM d, yyyy";

  static String dateToString(String value,
      {String formatDate = DATE_FORMAT_STANDART}) {
    return DateFormat(formatDate).format(DateTime.parse(value));
  }

  static String dateDifference(String date1, String date2) {
    int inDays = DateTime.parse(date2).difference(DateTime.parse(date1)).inDays;

    int years = (inDays / 365).floor();
    int months = ((inDays - years * 365) / 30).floor();
    if (years == 0 && months == 0) return "";
    return "(${years != 0 ? '$years Year' : ''}${years != 0 && months != 0 ? ' ' : ''}${months != 0 ? '$months Month' : ''})";
  }

  static String multiDateToString(String date1, {String? date2}) {
    return "${dateToString(date1, formatDate: DATE_FORMAT_MONTHYEAR)} - ${(date2 == null)
            ? 'present ${dateDifference(date1, DateTime.now().toString())}'
            : ("${dateToString(date2, formatDate: DateUtil.DATE_FORMAT_MONTHYEAR)} ${dateDifference(date1, date2)}")}";
  }
}
