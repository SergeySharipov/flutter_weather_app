import 'package:json_annotation/json_annotation.dart';

part 'feels_like.g.dart';

@JsonSerializable()
class FeelsLike {
  @JsonKey(name: "day")
  double day;
  @JsonKey(name: "night")
  double night;
  @JsonKey(name: "eve")
  double eve;
  @JsonKey(name: "morn")
  double morn;

  FeelsLike(this.day, this.night, this.eve, this.morn);

  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);
}
