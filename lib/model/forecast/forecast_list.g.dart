// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastList _$ForecastListFromJson(Map<String, dynamic> json) {
  return ForecastList(
    json['dt'] as int,
    json['main'] == null
        ? null
        : MainData.fromJson(json['main'] as Map<String, dynamic>),
    (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['clouds'] == null
        ? null
        : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    json['wind'] == null
        ? null
        : Wind.fromJson(json['wind'] as Map<String, dynamic>),
    json['visibility'] as int,
    (json['pop'] as num)?.toDouble(),
    json['sys'] == null
        ? null
        : Sys.fromJson(json['sys'] as Map<String, dynamic>),
    json['dt_txt'] as String,
  );
}

Map<String, dynamic> _$ForecastListToJson(ForecastList instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'sys': instance.sys,
      'dt_txt': instance.dtTxt,
    };
