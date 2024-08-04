import 'package:either_dart/either.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/extensions/_extensions.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Parsed<List<WeatherEntity>>>> getWeatherForecast(
    String? query,
  );
}
