import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather_app/screens/home.dart';
import 'package:flutter_weather_app/screens/about.dart';
import 'package:flutter_weather_app/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'network/network_data_service.dart';

void main() {
  _setupLogging();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
  ));
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
        child: GetMaterialApp(
            title: 'WeatherApp',
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: ThemeMode.system,
            initialRoute: '/home',
            routes: {
              '/home': (context) => Home(),
              '/about': (context) => About(),
            }));
  }
}
