import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/extensions/_extensions.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_app/services/pref_service.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  late MockGetWeatherForecastsUseCase mockGetWeatherForecastsUseCase;
  late WeatherCubit weatherCubit;
  SharedPreferences.setMockInitialValues({});

  await PrefService.init();

  setUp(() {
    mockGetWeatherForecastsUseCase = MockGetWeatherForecastsUseCase();
    weatherCubit = WeatherCubit(mockGetWeatherForecastsUseCase);
  });

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
  provideDummy<Either<Failure, Parsed<List<WeatherEntity>>>>(
      Right(testWeatherData));
  blocTest<WeatherCubit, WeatherState>(
      'should emit state with isLoading true then isLoaded true and contains '
      'list of weathers when data is fetched successfully',
      build: () {
        when(mockGetWeatherForecastsUseCase.execute(testQuery))
            .thenAnswer((_) async => Right(testWeatherData));
        return weatherCubit;
      },
      act: (cubit) => cubit.fetchForecastData(testQuery),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            const WeatherState(
              isLoading: true,
              isError: false,
              isLoaded: false,
              isOffline: false,
            ),
            const WeatherState(
              isLoading: false,
              isError: false,
              isLoaded: true,
              isOffline: false,
            ),
          ]);
}
