import 'package:weather_app/core/extensions/_extensions.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<Parsed<List<WeatherModel>>> getWeatherForecast(String? query);
}
