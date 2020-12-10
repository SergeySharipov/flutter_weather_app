import 'package:json_annotation/json_annotation.dart';

part 'main_data.g.dart';

@JsonSerializable()
class MainData {
  @JsonKey(name: "temp")
  double temp;
  @JsonKey(name: "feels_like")
  double feelsLike;
  @JsonKey(name: "temp_min")
  double tempMin;
  @JsonKey(name: "temp_max")
  double tempMax;
  @JsonKey(name: "pressure")
  int pressure;
  @JsonKey(name: "humidity")
  int humidity;
  @JsonKey(name: "sea_level")
  int seaLevel;
  @JsonKey(name: "grnd_level")
  int grndLevel;

  MainData(this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure,
      this.humidity, this.seaLevel, this.grndLevel);

  factory MainData.fromJson(Map<String, dynamic> json) =>
      _$MainDataFromJson(json);

  Map<String, dynamic> toJson() => _$MainDataToJson(this);
}
