import 'package:flutter_weather_app/model/common/clouds.dart';
import 'package:flutter_weather_app/model/common/main_data.dart';
import 'package:flutter_weather_app/model/common/weather.dart';
import 'package:flutter_weather_app/model/common/wind.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sys.dart';

part 'forecast_list.g.dart';

@JsonSerializable()
class ForecastList {
  @JsonKey(name: "dt")
  int dt;
  @JsonKey(name: "main")
  MainData main;
  @JsonKey(name: "weather")
  List<Weather> weather;
  @JsonKey(name: "clouds")
  Clouds clouds;
  @JsonKey(name: "wind")
  Wind wind;
  @JsonKey(name: "visibility")
  int visibility;
  @JsonKey(name: "pop")
  double pop;
  @JsonKey(name: "sys")
  Sys sys;
  @JsonKey(name: "dt_txt")
  String dtTxt;

  ForecastList(this.dt, this.main, this.weather, this.clouds, this.wind,
      this.visibility, this.pop, this.sys, this.dtTxt);

  factory ForecastList.fromJson(Map<String, dynamic> json) =>
      _$ForecastListFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastListToJson(this);
}
