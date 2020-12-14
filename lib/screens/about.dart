import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About this app'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("Weather App", style: TextStyle(fontSize: 30)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Made with ❤ by Serhii Sharipov",
                  style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("using Flutter", style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("and data from openweathermap.org",
                  style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
