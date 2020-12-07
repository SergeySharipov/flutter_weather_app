// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_data_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$NetworkDataService extends NetworkDataService {
  _$NetworkDataService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NetworkDataService;

  @override
  Future<Response<WeatherData>> getWeather(double lat, double lon) {
    final $url = 'data/2.5/weather';
    final $params = <String, dynamic>{'lat': lat, 'lon': lon};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<WeatherData, WeatherData>($request);
  }

  @override
  Future<Response<ForecastData>> getForecast(double lat, double lon) {
    final $url = 'data/2.5/forecast';
    final $params = <String, dynamic>{'lat': lat, 'lon': lon};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ForecastData, ForecastData>($request);
  }
}
