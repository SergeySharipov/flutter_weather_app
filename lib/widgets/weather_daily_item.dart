import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/one_call/daily.dart';
import 'package:intl/intl.dart';

class WeatherDailyItem extends StatelessWidget {
  final Daily daily;

  WeatherDailyItem({Key key, @required this.daily}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var date = new DateTime.fromMillisecondsSinceEpoch(daily.dt * 1000,
        isUtc: false);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(new DateFormat('E').format(date)),
            /*
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

             */
            Text('${daily.temp.min.round()}°/${daily.temp.max.round()}°'),
          ],
        ),
      ),
    );
  }
}
