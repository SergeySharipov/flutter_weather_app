import 'package:json_annotation/json_annotation.dart';

import 'daily.dart';
import 'hourly.dart';

part 'one_call_data.g.dart';

@JsonSerializable()
class OneCallData {
  @JsonKey(name: "lat")
  double lat;
  @JsonKey(name: "lon")
  double lon;
  @JsonKey(name: "timezone")
  String timezone;
  @JsonKey(name: "timezone_offset")
  int timezoneOffset;
  @JsonKey(name: "hourly")
  List<Hourly> hourly;
  @JsonKey(name: "daily")
  List<Daily> daily;

  OneCallData(this.lat, this.lon, this.timezone, this.timezoneOffset,
      this.hourly, this.daily);

  factory OneCallData.fromJson(Map<String, dynamic> json) =>
      _$OneCallDataFromJson(json);

  Map<String, dynamic> toJson() => _$OneCallDataToJson(this);
}
