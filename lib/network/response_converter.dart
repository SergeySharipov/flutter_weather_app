import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_weather_app/model/forecast/forecast_data.dart';
import 'package:flutter_weather_app/model/weather/weather_data.dart';

class ResponseConverter implements Converter {
  @override
  Request convertRequest(Request request) {
    return request;
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    try {
      var jsonResponse = json.decode(response.body);
      var convertedResponse;
      if (jsonResponse["cnt"] == null) {
        convertedResponse = WeatherData.fromJson(jsonResponse);
      } else {
        convertedResponse = ForecastData.fromJson(jsonResponse);
      }
      return response.copyWith<BodyType>(body: convertedResponse);
    } catch (e) {
      chopperLogger.warning(e);
      return response;
    }
  }
}
