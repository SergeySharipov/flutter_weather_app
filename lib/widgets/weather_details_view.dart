import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather/weather_data.dart';
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
        getTableRow("Sunrise", new DateFormat('h:mm a').format(sunrise)),
        getTableRow("Sunset", new DateFormat('h:mm a').format(sunset)),
        getTableRow("Description", weatherData.weather.first.description),
        getTableRow(
            "Feels like", weatherData.main.feelsLike.round().toString() + '°'),
        getTableRow(
            "High / Low",
            weatherData.main.tempMax.round().toString() +
                '°/ ' +
                weatherData.main.tempMin.round().toString() +
                '°'),
        getTableRow(
            "Wind",
            DegreeConverter.degreeToCardinalDirection(weatherData.wind.deg) +
                " " +
                weatherData.wind.speed.round().toString() +
                " km/h"),
        getTableRow("Humidity", weatherData.main.humidity.toString() + '%'),
        getTableRow("Pressure", weatherData.main.pressure.toString() + ' MB',
            isLast: true),
      ],
    );
  }
}
