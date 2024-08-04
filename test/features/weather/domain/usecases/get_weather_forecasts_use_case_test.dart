import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/extensions/_extensions.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather/domain/usecases/_usecase.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetWeatherForecastsUseCase getWeatherForecastsUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(
    () {
      mockWeatherRepository = MockWeatherRepository();
      getWeatherForecastsUseCase =
          GetWeatherForecastsUseCase(mockWeatherRepository);
    },
  );

  final testWeatherData = Parsed.fromDynamicData(
    200,
    [
      WeatherEntity(
        time: DateTime.now(),
        id: 100,
        main: 'Clouds',
        description: 'litte cloud',
        icon: '10d',
        temp: 29,
        tempMin: 29,
        tempMax: 29,
        pressure: 29,
        seaLevel: 29,
        grndLevel: 29,
        humidity: 29,
      ),
      WeatherEntity(
        time: DateTime.now(),
        id: 100,
        main: 'Clouds',
        description: 'litte cloud',
        icon: '10d',
        temp: 29,
        tempMin: 29,
        tempMax: 29,
        pressure: 29,
        seaLevel: 29,
        grndLevel: 29,
        humidity: 29,
      )
    ],
  );

  const testQuery = null;
  test(
    'should get weather forecasts from repository',
    () async {
      provideDummy<Either<Failure, Parsed<List<WeatherEntity>>>>(
          Right(testWeatherData));

      when(mockWeatherRepository.getWeatherForecast(testQuery))
          .thenAnswer((_) async => Right(
                testWeatherData,
              ));

      final res = await getWeatherForecastsUseCase.execute(testQuery);

      expect(
        res,
        Right(testWeatherData),
      );
    },
  );
}
