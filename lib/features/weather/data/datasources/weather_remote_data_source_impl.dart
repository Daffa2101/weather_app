import 'package:injectable/injectable.dart';
import 'package:weather_app/core/client/_client.dart';
import 'package:weather_app/core/environments/endpoints.dart';
import 'package:weather_app/core/extensions/_extensions.dart';
import 'package:weather_app/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

@Injectable(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  @override
  Future<Parsed<List<WeatherModel>>> getWeatherForecast(String? query) async {
    const url = EndPoints.forecast;
    final param = query == null
        ? {
            'lat': -6.175115064391812,
            'lon': 106.82708842419382,
            'appid': EndPoints.apiKey,
            'units': 'metric',
            'limit': 5
          }
        : {
            'q': query,
            'appid': EndPoints.apiKey,
            'units': 'metric',
            'limit': 5
          };

    final resp = await getIt(
      url,
      queryParameters: param,
    );

    final datas = resp.dataAsList;
    final forecasts = <WeatherModel>[];
    for (var forecast in datas) {
      forecasts.add(
        WeatherModel.fromJson(forecast),
      );
    }

    return resp.parseDynamicData(forecasts);
  }
}
