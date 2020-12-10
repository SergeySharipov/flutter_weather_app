// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daily _$DailyFromJson(Map<String, dynamic> json) {
  return Daily(
    json['dt'] as int,
    json['sunrise'] as int,
    json['sunset'] as int,
    json['temp'] == null
        ? null
        : Temp.fromJson(json['temp'] as Map<String, dynamic>),
    json['feels_like'] == null
        ? null
        : FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
    json['pressure'] as int,
    json['humidity'] as int,
    (json['dew_point'] as num)?.toDouble(),
    (json['wind_speed'] as num)?.toDouble(),
    json['wind_deg'] as int,
    (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['clouds'] as int,
    (json['pop'] as num)?.toDouble(),
    (json['uvi'] as num)?.toDouble(),
    (json['rain'] as num)?.toDouble(),
    (json['snow'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'uvi': instance.uvi,
      'rain': instance.rain,
      'snow': instance.snow,
    };
