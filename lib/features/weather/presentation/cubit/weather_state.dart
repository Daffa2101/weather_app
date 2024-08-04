part of 'weather_cubit.dart';

class WeatherState extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool isError;
  final String? errorMsg;
  final List<WeatherEntity>? weathers;
  final String? location;
  final bool isOffline;
  const WeatherState({
    this.isLoading = true,
    this.isLoaded = false,
    this.isError = false,
    this.isOffline = false,
    this.errorMsg,
    this.weathers,
    this.location,
  });

  WeatherState copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? isError,
    bool? isOffline,
    String? errorMsg,
    List<WeatherEntity>? weathers,
    String? location,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      errorMsg: errorMsg ?? this.errorMsg,
      weathers: weathers ?? this.weathers,
      isOffline: isOffline ?? this.isOffline,
      location: location ?? this.location,
    );
  }

  @override
  List<Object> get props => [isLoading, isLoaded, isError, isOffline];
}
