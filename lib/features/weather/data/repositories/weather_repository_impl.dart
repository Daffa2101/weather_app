import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/client/_client.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/extensions/_extensions.dart';
import 'package:weather_app/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _remoteDataSource;
  WeatherRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Parsed<List<WeatherEntity>>>> getWeatherForecast(
      String? query) {
    return apiCall(
      _remoteDataSource.getWeatherForecast(query),
    );
  }
}
