import 'package:weather_app/features/weather/domain/entities/wind_entity.dart';

class WindModel extends WindEntity {
  WindModel({super.speed, super.deg});

  WindModel.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    return data;
  }
}
