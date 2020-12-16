import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather/weather_data.dart';
import 'package:flutter_weather_app/utils/app_localizations_helper.dart';
import 'package:flutter_weather_app/utils/degree_converter.dart';
import 'package:intl/intl.dart';

class WeatherDetailsView extends StatelessWidget {
  final WeatherData weatherData;

  WeatherDetailsView({Key key, @required this.weatherData}) : super(key: key);

  getTableRow(String title, String detail, {bool isLast = false}) {
    var divider;
    if (isLast) {
      divider = BoxDecoration();
    } else {
      divider = BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0x1AFFFFFF))),
      );
    }
    return TableRow(
      decoration: divider,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(title),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            detail,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime sunrise = new DateTime.fromMillisecondsSinceEpoch(
        weatherData.sys.sunrise * 1000,
        isUtc: false);
    DateTime sunset = new DateTime.fromMillisecondsSinceEpoch(
        weatherData.sys.sunset * 1000,
        isUtc: false);
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        getTableRow(
            getTranslated(context, "sunrise"),
            new DateFormat(getTranslated(context, "dateFormatHoursMinutes"), Platform.localeName)
                .format(sunrise)),
        getTableRow(
            getTranslated(context, "sunset"),
            new DateFormat(getTranslated(context, "dateFormatHoursMinutes"), Platform.localeName)
                .format(sunset)),
        getTableRow(getTranslated(context, "description"),
            weatherData.weather.first.description),
        getTableRow(getTranslated(context, "feelsLike"),
            weatherData.main.feelsLike.round().toString() + '°'),
        getTableRow(
            getTranslated(context, "high") +
                ' / ' +
                getTranslated(context, "low"),
            weatherData.main.tempMax.round().toString() +
                '°/ ' +
                weatherData.main.tempMin.round().toString() +
                '°'),
        getTableRow(
            getTranslated(context, "wind"),
            DegreeConverter.degreeToCardinalDirection(context, weatherData.wind.deg) +
                " " +
                weatherData.wind.speed.round().toString() +
                " " +
                getTranslated(context, "kmHour")),
        getTableRow(getTranslated(context, "humidity"),
            weatherData.main.humidity.toString() + '%'),
        getTableRow(
            getTranslated(context, "pressure"),
            weatherData.main.pressure.toString() +
                ' ' +
                getTranslated(context, "pressureUnit"),
            isLast: true),
      ],
    );
  }
}
