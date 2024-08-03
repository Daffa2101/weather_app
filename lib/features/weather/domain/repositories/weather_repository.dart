import 'package:either_dart/either.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/extensions/_extensions.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Parsed<List<WeatherModel>>>> getWeatherForecast(
    String? query,
  );
}
