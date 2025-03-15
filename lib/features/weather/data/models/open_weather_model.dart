import 'package:weather_app/features/weather/domain/entities/open_weather_entity.dart';

import 'weather_main_model.dart';
import 'weather_model.dart';
import 'wind_model.dart';

class OpenWeatherModel extends OpenWeatherEntity {
  OpenWeatherModel(
      {super.weather,
      super.main,
      int? visibility,
      super.wind,
      int? dt,
      int? timezone,
      int? id,
      String? name,
      int? cod});

  OpenWeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = <WeatherModel>[];
      json['weather'].forEach((v) {
        weather!.add(WeatherModel.fromJson(v));
      });
    }
    main =
        json['main'] != null ? WeatherMainModel.fromJson(json['main']) : null;
    wind = json['wind'] != null ? WindModel.fromJson(json['wind']) : null;
  }
}
