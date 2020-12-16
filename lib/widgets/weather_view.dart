
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather/weather_data.dart';
import 'package:flutter_weather_app/utils/app_localizations_helper.dart';

class WeatherView extends StatelessWidget {
  final WeatherData weatherData;

  WeatherView({Key key, @required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              Text(weatherData.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://openweathermap.org/img/wn/${weatherData.weather.first.icon}.png',
                height: 30,
              ),
              Text(
              getTranslated(context, weatherData.weather.first.main.toLowerCase()),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Text(
          ' ${weatherData.main.temp.round()}°',
          style: TextStyle(fontSize: 60),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${weatherData.main.tempMax.round()}°/${weatherData.main.tempMin.round()}° ' +
                getTranslated(context, "feelsLike") +
                ' ${weatherData.main.feelsLike.round()}°',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            getTranslated(context, "updated") +
                ": " +
                getTranslatedCurrentDate(context),
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
