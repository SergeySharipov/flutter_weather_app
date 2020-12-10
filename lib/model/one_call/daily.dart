import 'package:json_annotation/json_annotation.dart';

import '../common/temp.dart';
import '../common/weather.dart';
import 'feels_like.dart';

part 'daily.g.dart';

@JsonSerializable()
class Daily {
  @JsonKey(name: "dt")
  int dt;
  @JsonKey(name: "sunrise")
  int sunrise;
  @JsonKey(name: "sunset")
  int sunset;
  @JsonKey(name: "temp")
  Temp temp;
  @JsonKey(name: "feels_like")
  FeelsLike feelsLike;
  @JsonKey(name: "pressure")
  int pressure;
  @JsonKey(name: "humidity")
  int humidity;
  @JsonKey(name: "dew_point")
  double dewPoint;
  @JsonKey(name: "wind_speed")
  double windSpeed;
  @JsonKey(name: "wind_deg")
  int windDeg;
  @JsonKey(name: "weather")
  List<Weather> weather;
  @JsonKey(name: "clouds")
  int clouds;
  @JsonKey(name: "pop")
  double pop;
  @JsonKey(name: "uvi")
  double uvi;
  @JsonKey(name: "rain")
  double rain;
  @JsonKey(name: "snow")
  double snow;

  Daily(
      this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.windSpeed,
      this.windDeg,
      this.weather,
      this.clouds,
      this.pop,
      this.uvi,
      this.rain,
      this.snow);

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}
