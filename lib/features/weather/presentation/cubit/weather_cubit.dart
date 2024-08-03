import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/constants/pref_keys.dart';

import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/domain/usecases/_usecase.dart';
import 'package:weather_app/services/pref_service.dart';

part 'weather_state.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherForecastsUseCase _getWeatherForecastsUseCase;

  WeatherCubit(
    this._getWeatherForecastsUseCase,
  ) : super(const WeatherState());

  Future<void> init() async {
    emit(
      state.copyWith(isLoading: true),
    );

    await fetchForecastData(null);
  }

  Future<void> fetchForecastData(String? query) async {
    emit(
      state.copyWith(isLoading: true),
    );

    final res = _getWeatherForecastsUseCase.execute(query);

    await res.fold(
      (left) {
        emit(
          state.copyWith(
            isLoading: false,
            isLoaded: false,
            isError: true,
            errorMsg: left.message,
          ),
        );
      },
      (right) {
        emit(
          state.copyWith(
            isLoading: false,
            isLoaded: true,
            weathers: right.data,
            location: query ?? 'National Monument (Monas)',
          ),
        );
      },
    );
  }
}
