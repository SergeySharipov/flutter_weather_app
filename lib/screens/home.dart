import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/forecast/forecast_data.dart';
import 'package:flutter_weather_app/model/weather/weather_data.dart';
import 'package:flutter_weather_app/network/network_data_service.dart';
import 'package:flutter_weather_app/utils/geolocation_helper.dart';
import 'package:flutter_weather_app/widgets/weather_hourly_item.dart';
import 'package:flutter_weather_app/widgets/weather_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  WeatherData weatherData;
  ForecastData forecastData;

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  loadWeather() async {
    setState(() {
      isLoading = true;
    });
    Position position = await GeolocationHelper.getCurrentPosition();

    if (position != null) {
      final lat = position.latitude;
      final lon = position.longitude;
      var weatherResponse =
          await Provider.of<NetworkDataService>(context, listen: false)
              .getWeather(lat, lon);
      var forecastResponse =
          await Provider.of<NetworkDataService>(context, listen: false)
              .getForecast(lat, lon);

      if (weatherResponse.statusCode == 200 &&
          forecastResponse.statusCode == 200) {
        return setState(() {
          weatherData = weatherResponse.body;
          forecastData = forecastResponse.body;
          isLoading = false;
        });
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: weatherData != null
                      ? WeatherView(weatherData: weatherData)
                      : Container(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isLoading
                      ? CircularProgressIndicator(
                          strokeWidth: 2.0,
                        )
                      : IconButton(
                          icon: new Icon(Icons.refresh),
                          tooltip: 'Refresh',
                          onPressed: loadWeather,
                        ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 110.0,
                child: forecastData != null
                    ? ListView.builder(
                        itemCount: forecastData.list.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => WeatherHourlyItem(
                            forecastList: forecastData.list[index]))
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
