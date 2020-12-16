import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app/model/one_call/one_call_data.dart';
import 'package:flutter_weather_app/model/weather/weather_data.dart';
import 'package:flutter_weather_app/network/network_data_service.dart';
import 'package:flutter_weather_app/utils/app_localizations_helper.dart';
import 'package:flutter_weather_app/utils/geolocation_helper.dart';
import 'package:flutter_weather_app/widgets/weather_daily_item.dart';
import 'package:flutter_weather_app/widgets/weather_details_view.dart';
import 'package:flutter_weather_app/widgets/weather_hourly_item.dart';
import 'package:flutter_weather_app/widgets/weather_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  WeatherData weatherData;
  OneCallData oneCallData;
  DateTime lastUpdate;

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

    Position position = await getCurrentLocation();

    if (await isOnline()) {
      var weatherResponse =
          await Provider.of<NetworkDataService>(context, listen: false)
              .getWeather(position.latitude, position.longitude)
              .timeout(Duration(seconds: 5));
      var oneCallResponse =
          await Provider.of<NetworkDataService>(context, listen: false)
              .getOneCall(position.latitude, position.longitude)
              .timeout(Duration(seconds: 5));

      if (weatherResponse.statusCode == 200 &&
          oneCallResponse.statusCode == 200) {
        return setState(() {
          weatherData = weatherResponse.body;
          oneCallData = oneCallResponse.body;
          lastUpdate =  DateTime.now();
          isLoading = false;
        });
      }
    } else {
      showErrorMsg(getTranslated(context, "errorMsgInternet"));
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<Position> getCurrentLocation() async {
    Position position;

    if (await Permission.location.request().isGranted) {
      position = await GeolocationHelper.getCurrentPosition();
    }

    if (position != null) {
      return position;
    } else {
      showErrorMsg(getTranslated(context, "errorMsgLocation"));
      position = new Position(longitude: 43.64, latitude: -79.39);
      return position;
    }
  }

  Future<bool> isOnline() async {
    var connectivityResult = await (Connectivity().checkConnectivity())
        .timeout(Duration(seconds: 5));
    return (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi);
  }

  showErrorMsg(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                weatherData != null
                    ? WeatherView(weatherData: weatherData, lastUpdate: lastUpdate)
                    : Container(),
                SizedBox(
                  height: 48,
                  child: isLoading
                      ? const SpinKitChasingDots(
                          color: Colors.white,
                          size: 25,
                        )
                      : IconButton(
                          icon: new Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                          tooltip: getTranslated(context, "refresh"),
                          onPressed: loadWeather,
                        ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(21, 4, 4, 0),
                  child: Text(getTranslated(context, "hourly")),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 155.0,
                  child: oneCallData != null
                      ? ListView.builder(
                          itemCount: 24,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => WeatherHourlyItem(
                              hourly: oneCallData.hourly[index]))
                      : Container(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(21, 4, 4, 0),
                  child: Text(getTranslated(context, "daily")),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 155.0,
                  child: oneCallData != null
                      ? ListView.builder(
                          itemCount: oneCallData.daily.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              WeatherDailyItem(daily: oneCallData.daily[index]))
                      : Container(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(21, 4, 4, 0),
                  child: Text(getTranslated(context, "details")),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: weatherData != null
                  ? WeatherDetailsView(weatherData: weatherData)
                  : Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                icon: new Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                tooltip: getTranslated(context, "about"),
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
