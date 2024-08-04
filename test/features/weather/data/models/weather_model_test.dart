import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  final testWeatherModel = WeatherModel(
      time: DateTime.fromMillisecondsSinceEpoch(1722740400 * 1000, isUtc: true),
      id: 100,
      main: 'Clouds',
      description: 'little cloud',
      icon: '10d',
      temp: 29,
      tempMin: 29,
      tempMax: 29,
      pressure: 29,
      seaLevel: 29,
      grndLevel: 29,
      humidity: 29);

  test('should be a subclass of weather entity', () async {
    expect(testWeatherModel, isA<WeatherEntity>());
  });

  test('should return weather model from json', () async {
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_weather_response.json'),
    );

    final result = WeatherModel.fromJson(jsonMap);

    expect(result, equals(testWeatherModel));
  });

  test(
    'should return a json map containing all of weather model attributes',
    () async {
      final result = testWeatherModel.toJson();

      final expectedJson = {
        'dt': 1722740400,
        'weather': [
          {
            'id': 100,
            'main': 'Clouds',
            'description': 'little cloud',
            'icon': '10d',
          }
        ],
        'main': {
          'temp': 29,
          'temp_min': 29,
          'temp_max': 29,
          'pressure': 29,
          'sea_level': 29,
          'grnd_level': 29,
          'humidity': 29,
        }
      };

      expect(result, equals(expectedJson));
    },
  );
}
