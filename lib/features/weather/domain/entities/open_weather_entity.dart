import 'package:weather_app/features/weather/domain/entities/weather_main_entity.dart';

import 'weather_entity.dart';
import 'wind_entity.dart';

class OpenWeatherEntity {
  List<WeatherEntity>? weather;
  WeatherMainEntity? main;
  WindEntity? wind;

  OpenWeatherEntity({
    this.weather,
    this.main,
    this.wind,
  });
}
