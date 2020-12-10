import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/one_call/one_call_data.dart';
import 'package:flutter_weather_app/model/weather/weather_data.dart';
import 'package:flutter_weather_app/network/network_data_service.dart';
import 'package:flutter_weather_app/utils/geolocation_helper.dart';
import 'package:flutter_weather_app/widgets/weather_daily_item.dart';
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
  OneCallData oneCallData;

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
      var oneCallResponse =
          await Provider.of<NetworkDataService>(context, listen: false)
              .getOneCall(lat, lon);

      if (weatherResponse.statusCode == 200 &&
          oneCallResponse.statusCode == 200) {
        return setState(() {
          weatherData = weatherResponse.body;
          oneCallData = oneCallResponse.body;
          print("------------"+oneCallData.hourly.first.toJson().toString());
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
                child: oneCallData != null
                    ? ListView.builder(
                        itemCount: 12,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => WeatherHourlyItem(
                            hourly: oneCallData.hourly[index]))
                    : Container(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 110.0,
                child: oneCallData != null
                    ? ListView.builder(
                    itemCount: oneCallData.daily.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => WeatherDailyItem(
                        daily: oneCallData.daily[index]))
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
