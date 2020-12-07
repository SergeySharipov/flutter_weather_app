import 'package:chopper/chopper.dart';
import 'package:flutter_weather_app/model/forecast/forecast_data.dart';
import 'package:flutter_weather_app/model/weather/weather_data.dart';
import 'package:flutter_weather_app/network/authorization_interceptor.dart';
import 'package:flutter_weather_app/network/response_converter.dart';

part 'network_data_service.chopper.dart';

@ChopperApi()
abstract class NetworkDataService extends ChopperService {
  static NetworkDataService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.openweathermap.org/',
      interceptors: [AuthorizationInterceptor(), HttpLoggingInterceptor()],
      converter: ResponseConverter(),
      errorConverter: JsonConverter(),
      services: [
        _$NetworkDataService(),
      ],
    );
    return _$NetworkDataService(client);
  }

  @Get(path: 'data/2.5/weather')
  Future<Response<WeatherData>> getWeather(
      @Query("lat") double lat, @Query("lon") double lon);

  @Get(path: 'data/2.5/forecast')
  Future<Response<ForecastData>> getForecast(
      @Query("lat") double lat, @Query("lon") double lon);
}
