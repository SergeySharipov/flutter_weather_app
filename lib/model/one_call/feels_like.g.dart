// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feels_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeelsLike _$FeelsLikeFromJson(Map<String, dynamic> json) {
  return FeelsLike(
    (json['day'] as num)?.toDouble(),
    (json['night'] as num)?.toDouble(),
    (json['eve'] as num)?.toDouble(),
    (json['morn'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FeelsLikeToJson(FeelsLike instance) => <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
