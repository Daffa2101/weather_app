import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final DateTime time;
  final int id;
  final String main;
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final double pressure;
  final double seaLevel;
  final double grndLevel;
  final double humidity;

  const WeatherEntity({
    required this.time,
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
  });

  @override
  List<Object?> get props => [
        time,
        id,
        main,
        description,
        icon,
        temp,
        tempMin,
        tempMax,
        pressure,
        seaLevel,
        grndLevel,
        humidity,
      ];
}
