import 'package:api_handler/api_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/weather/domain/entities/open_weather_entity.dart';
import 'package:weather_app/features/weather/domain/use_cases/get_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._getWeatherUsecase) : super(WeatherInitial());
  final GetWeatherUsecase _getWeatherUsecase;

  Future getWeather(String city) async {
    try {
      final result = await _getWeatherUsecase(GetWeatherParams(city: city));
      if (result.result == ResultEnum.success) {
        emit(WeatherLoadedState(result.data));
      } else {
        emit(WeatherError(error: result.message ?? "ERROR"));
      }
    } catch (e) {
      emit(WeatherError(error: e.toString()));
    }
  }
}
