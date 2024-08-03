part of '_usecase.dart';

@injectable
class GetWeatherForecastsUseCase
    implements UseCase<Parsed<List<WeatherModel>>, String> {
  final WeatherRepository _repository;
  GetWeatherForecastsUseCase(this._repository);
  @override
  Future<Either<Failure, Parsed<List<WeatherModel>>>> execute([
    String? args,
  ]) {

    return _repository.getWeatherForecast(args);
  }
}
