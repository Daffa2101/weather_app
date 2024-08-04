part of '_usecase.dart';

@injectable
class GetWeatherForecastsUseCase
    implements UseCase<Parsed<List<WeatherEntity>>, String> {
  final WeatherRepository _repository;

  GetWeatherForecastsUseCase(this._repository);

  @override
  Future<Either<Failure, Parsed<List<WeatherEntity>>>> execute([
    String? args,
  ]) {
    return _repository.getWeatherForecast(args);
  }
}
