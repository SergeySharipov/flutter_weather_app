import 'package:json_annotation/json_annotation.dart';

import '../common/weather.dart';

part 'hourly.g.dart';

@JsonSerializable()
class Hourly {
  @JsonKey(name: "dt")
  int dt;
  @JsonKey(name: "temp")
  double temp;
  @JsonKey(name: "feels_like")
  double feelsLike;
  @JsonKey(name: "pressure")
  int pressure;
  @JsonKey(name: "humidity")
  int humidity;
  @JsonKey(name: "dew_point")
  double dewPoint;
  @JsonKey(name: "uvi")
  double uvi;
  @JsonKey(name: "clouds")
  int clouds;
  @JsonKey(name: "visibility")
  int visibility;
  @JsonKey(name: "wind_speed")
  double windSpeed;
  @JsonKey(name: "wind_deg")
  int windDeg;
  @JsonKey(name: "weather")
  List<Weather> weather;
  @JsonKey(name: "pop")
  double pop;

  Hourly(
      this.dt,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.weather,
      this.pop);

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
