import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/one_call/daily.dart';
import 'package:flutter_weather_app/utils/app_localizations.dart';
import 'package:flutter_weather_app/utils/app_localizations_helper.dart';
import 'package:intl/intl.dart';

class WeatherDailyItem extends StatelessWidget {
  final Daily daily;

  WeatherDailyItem({Key key, @required this.daily}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateNow = new DateTime.now();
    var date =
        new DateTime.fromMillisecondsSinceEpoch(daily.dt * 1000, isUtc: false);
    var dateText =
        dateNow.day == date.day ? getTranslated(context, "today") : new DateFormat('E', Platform.localeName).format(date);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              dateText,
              style: TextStyle(fontSize: 14),
            ),
          ),
          CachedNetworkImage(
            imageUrl:
                'https://openweathermap.org/img/wn/${daily.weather.first.icon}.png',
            height: 30,
          ),
          Text(getTranslated(context, daily.weather.first.main.toLowerCase())),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '💧${(daily.pop * 100).round()}%',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${daily.temp.day.round()}° ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '${daily.temp.night.round()}°',
                  style: TextStyle(color: Colors.grey[300], fontSize: 12),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
