import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/home.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'network/network_data_service.dart';

void main() {
  _setupLogging();
  runApp(WeatherApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => NetworkDataService.create(),
        dispose: (_, NetworkDataService service) => service.client.dispose(),
        child: MaterialApp(
            title: 'WeatherApp',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryColor: Colors.red,
              primaryColorDark: Colors.red[800],
              accentColor: Colors.red,
            ),
            initialRoute: '/home',
            routes: {
              '/home': (context) => Home(),
            }));
  }
}
