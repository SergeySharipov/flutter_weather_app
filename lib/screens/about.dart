import 'package:flutter/material.dart';
import 'package:flutter_weather_app/utils/app_localizations_helper.dart';
import 'package:package_info/package_info.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  String appName = "Flutter Weather App";
  String appVersion = "1.0";

  @override
  void initState() {
    super.initState();
    getAppInfo();
  }

  void getAppInfo() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        appName = packageInfo.appName;
        appVersion = packageInfo.version;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, "about")),
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
              child: Text(appName, style: TextStyle(fontSize: 30)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(getTranslated(context, "aboutLine1"),
                  style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(getTranslated(context, "aboutLine2"),
                  style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(getTranslated(context, "aboutLine3"),
                  style: TextStyle(fontSize: 20)),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  getTranslated(context, "aboutVersion") +": "+appVersion,
                )),
          ],
        ),
      ),
    );
  }
}
