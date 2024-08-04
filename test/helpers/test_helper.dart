import 'package:mockito/annotations.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/features/weather/domain/usecases/_usecase.dart';

@GenerateMocks(
  [
    WeatherRepository,
    GetWeatherForecastsUseCase,
    Failure,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
