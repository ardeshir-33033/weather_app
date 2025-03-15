import 'package:weather_app/features/weather/domain/entities/weather_main_entity.dart';

class WeatherMainModel extends WeatherMainEntity {
  WeatherMainModel(
      {super.temp,
      super.feelsLike,
      super.tempMin,
      super.tempMax,
      super.pressure,
      super.humidity,
      super.seaLevel,
      super.grndLevel});

  WeatherMainModel.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    return data;
  }
}
