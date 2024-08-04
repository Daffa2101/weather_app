import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required super.time,
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
    required super.temp,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.seaLevel,
    required super.grndLevel,
    required super.humidity,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        time: DateTime.fromMillisecondsSinceEpoch(
          (json['dt'] as int) * 1000,
          isUtc: true,
        ),
        id: json['weather'][0]['id'] as int,
        main: json['weather'][0]['main'] as String,
        description: json['weather'][0]['description'] as String,
        icon: json['weather'][0]['icon'] as String,
        temp: (json['main']['temp'] as num).toDouble(),
        tempMin: (json['main']['temp_min'] as num).toDouble(),
        tempMax: (json['main']['temp_max'] as num).toDouble(),
        pressure: (json['main']['pressure'] as num).toDouble(),
        seaLevel: (json['main']['sea_level'] as num).toDouble(),
        grndLevel: (json['main']['grnd_level'] as num).toDouble(),
        humidity: (json['main']['humidity'] as num).toDouble(),
      );

  WeatherEntity toEntity() => WeatherEntity(
      time: time,
      id: id,
      main: main,
      description: description,
      icon: icon,
      temp: temp,
      tempMin: tempMin,
      tempMax: tempMax,
      pressure: pressure,
      seaLevel: seaLevel,
      grndLevel: grndLevel,
      humidity: humidity);
}
