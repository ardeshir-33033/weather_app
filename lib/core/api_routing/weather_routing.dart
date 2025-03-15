import 'package:weather_app/core/env/environment.dart';

class WeatherRouting {
  static const _initial = "weather/";
  static final getWeatherRoute =
      "${Environment.apiBaseUrl}$_initial";
}
