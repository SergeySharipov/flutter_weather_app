import 'package:flutter/material.dart';
import 'package:flutter_weather_app/utils/app_localizations.dart';
import 'package:intl/intl.dart';

String getTranslated(BuildContext context, String key) {
  return AppLocalizations.of(context).translate(key);
}

String getLanguageCode(BuildContext context) {
  return AppLocalizations.of(context).locale.languageCode;
}

String getTranslatedDate(BuildContext context, int dt, String dateFormat) {
  return DateFormat(
          getTranslated(context, dateFormat), getLanguageCode(context))
      .format(new DateTime.fromMillisecondsSinceEpoch(dt * 1000, isUtc: false));
}

String getTranslatedDateFormatFull(BuildContext context, DateTime dateTime) {
  return DateFormat(
      getTranslated(context, "dateFormatFull"), getLanguageCode(context))
      .format(dateTime);
}
