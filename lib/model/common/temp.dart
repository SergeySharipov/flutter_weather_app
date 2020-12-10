import 'package:json_annotation/json_annotation.dart';

part 'temp.g.dart';

@JsonSerializable()
class Temp {
  @JsonKey(name: "day")
  double day;
  @JsonKey(name: "min")
  double min;
  @JsonKey(name: "max")
  double max;
  @JsonKey(name: "night")
  double night;
  @JsonKey(name: "eve")
  double eve;
  @JsonKey(name: "morn")
  double morn;

  Temp(this.day, this.min, this.max, this.night, this.eve, this.morn);

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Map<String, dynamic> toJson() => _$TempToJson(this);
}
