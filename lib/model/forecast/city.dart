import 'package:flutter_weather_app/model/common/coord.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "coord")
  Coord coord;
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "population")
  int population;
  @JsonKey(name: "timezone")
  int timezone;
  @JsonKey(name: "sunrise")
  int sunrise;
  @JsonKey(name: "sunset")
  int sunset;

  City(this.id, this.name, this.coord, this.country, this.population,
      this.timezone, this.sunrise, this.sunset);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
