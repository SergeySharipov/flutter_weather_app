import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/one_call/hourly.dart';
import 'package:flutter_weather_app/utils/app_localizations.dart';
import 'package:flutter_weather_app/utils/app_localizations_helper.dart';
import 'package:intl/intl.dart';

class WeatherHourlyItem extends StatelessWidget {
  final Hourly hourly;

  WeatherHourlyItem({Key key, @required this.hourly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weather = hourly.weather.first;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              getTranslatedDate(context,hourly.dt, "dateFormatHours").toLowerCase(),
              style: TextStyle(fontSize: 14),
            ),
          ),
          CachedNetworkImage(
            imageUrl: 'https://openweathermap.org/img/wn/${weather.icon}.png',
            height: 30,
          ),
          Text(getTranslated(context, weather.main.toLowerCase())),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '💧${(hourly.pop * 100).round()}%',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              '${hourly.temp.round()}°',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
