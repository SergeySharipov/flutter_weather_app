import 'package:json_annotation/json_annotation.dart';

import 'city.dart';
import 'forecast_list.dart';

part 'forecast_data.g.dart';

@JsonSerializable()
class ForecastData {
  @JsonKey(name: "cod")
  String cod;
  @JsonKey(name: "message")
  int message;
  @JsonKey(name: "cnt")
  int cnt;
  @JsonKey(name: "list")
  List<ForecastList> list;
  @JsonKey(name: "city")
  City city;

  ForecastData(this.cod, this.message, this.cnt, this.list, this.city);

  factory ForecastData.fromJson(Map<String, dynamic> json) =>
      _$ForecastDataFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDataToJson(this);
}
