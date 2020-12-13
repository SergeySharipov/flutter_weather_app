import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.white,

    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.grey[900],
  );
}

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.white,

    scaffoldBackgroundColor: Colors.blue[400],
    cardColor: Colors.blue[300],
  );
}
