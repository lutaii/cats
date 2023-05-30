import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDateTimeToLocaleString(
      DateTime dateTime, BuildContext context) {
    return DateFormat.yMMMMd(Localizations.localeOf(context).languageCode)
        .format(dateTime);
  }
}
