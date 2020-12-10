// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_call_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneCallData _$OneCallDataFromJson(Map<String, dynamic> json) {
  return OneCallData(
    (json['lat'] as num)?.toDouble(),
    (json['lon'] as num)?.toDouble(),
    json['timezone'] as String,
    json['timezone_offset'] as int,
    (json['hourly'] as List)
        ?.map((e) =>
            e == null ? null : Hourly.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['daily'] as List)
        ?.map(
            (e) => e == null ? null : Daily.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OneCallDataToJson(OneCallData instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
