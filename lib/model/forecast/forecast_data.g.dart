// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastData _$ForecastDataFromJson(Map<String, dynamic> json) {
  return ForecastData(
    json['cod'] as String,
    json['message'] as int,
    json['cnt'] as int,
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : ForecastList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ForecastDataToJson(ForecastData instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };
