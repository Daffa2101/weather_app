part of 'weather_cubit.dart';

class WeatherState extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool isError;
  final String? errorMsg;
  final List<WeatherModel>? weathers;
  final String? location;
  const WeatherState({
    this.isLoading = true,
    this.isLoaded = false,
    this.isError = false,
    this.errorMsg,
    this.weathers,
    this.location,
  });

  WeatherState copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? isError,
    String? errorMsg,
    List<WeatherModel>? weathers,
    String? location,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      errorMsg: errorMsg ?? this.errorMsg,
      weathers: weathers ?? this.weathers,
      location: location ?? this.location,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isLoaded,
        isError,
      ];
}
