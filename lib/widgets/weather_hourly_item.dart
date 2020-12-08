import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/forecast/forecast_list.dart';
import 'package:intl/intl.dart';

class WeatherHourlyItem extends StatelessWidget {
  final ForecastList forecastList;

  WeatherHourlyItem({Key key, @required this.forecastList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weather = forecastList.weather.first;
    var date = new DateTime.fromMillisecondsSinceEpoch(forecastList.dt * 1000,
        isUtc: false);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(new DateFormat('h a').format(date)),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://openweathermap.org/img/wn/${weather.icon}.png',
                    height: 26,
                  ),
                  Text(
                    weather.main,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Text('${(forecastList.pop * 100).round()}%'),
            Text('${forecastList.main.temp.round()}°'),
          ],
        ),
      ),
    );
  }
}
