import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather/weather_data.dart';
import 'package:intl/intl.dart';

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
                Icons.location_on,color: Colors.white,
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
                weatherData.weather.first.main,
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
                'Feels like ${weatherData.main.feelsLike.round()}°',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("Updated: "+ new DateFormat('E., MMM d, h:mm a').format(
              new DateTime.fromMillisecondsSinceEpoch(weatherData.dt * 1000,
                  isUtc: false))),
        ),
      ],
    );
  }
}
