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
      print('-------convertResponse()----------');
      var jsonResponse = json.decode(response.body);
      print('-------jsonResponse----------' + jsonResponse.toString());
      var convertedResponse;
      if (jsonResponse["cnt"] == null) {
        print('-------WeatherData---------- start');
        convertedResponse = WeatherData.fromJson(jsonResponse);
        print('-------WeatherData----------' + convertedResponse.toString());
      } else {
        print('-------ForecastData---------- start');
        convertedResponse = ForecastData.fromJson(jsonResponse);
        print('-------ForecastData----------' + convertedResponse.toString());
      }
      return response.copyWith<BodyType>(body: convertedResponse);
    } catch (e) {
      chopperLogger.warning(e);
      return response;
    }
  }
}
