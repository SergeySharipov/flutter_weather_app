import 'package:flutter_weather_app/model/common/clouds.dart';
import 'package:flutter_weather_app/model/common/coord.dart';
import 'package:flutter_weather_app/model/common/main_data.dart';
import 'package:flutter_weather_app/model/common/weather.dart';
import 'package:flutter_weather_app/model/common/wind.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sys.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  @JsonKey(name: "coord")
  Coord coord;
  @JsonKey(name: "weather")
  List<Weather> weather;
  @JsonKey(name: "base")
  String base;
  @JsonKey(name: "main")
  MainData main;
  @JsonKey(name: "visibility")
  int visibility;
  @JsonKey(name: "wind")
  Wind wind;
  @JsonKey(name: "clouds")
  Clouds clouds;
  @JsonKey(name: "dt")
  int dt;
  @JsonKey(name: "sys")
  Sys sys;
  @JsonKey(name: "timezone")
  int timezone;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "cod")
  int cod;

  WeatherData(
      this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod);

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
