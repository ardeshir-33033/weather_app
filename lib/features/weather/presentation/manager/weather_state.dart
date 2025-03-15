part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(this.weatherEntity);
  final OpenWeatherEntity weatherEntity;
}

class WeatherError extends WeatherState {
  WeatherError({required this.error});
  final String error;
}
