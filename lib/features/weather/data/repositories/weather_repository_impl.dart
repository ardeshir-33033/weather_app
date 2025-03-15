import 'package:api_handler/feature/api_handler/data/models/response_model.dart';
import 'package:weather_app/features/weather/data/data_sources/weather_data_source.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDataSource _weatherListDataSource;

  WeatherRepositoryImpl(this._weatherListDataSource);

  @override
  Future<ResponseModel> getWeather(String city, {String? units}) async {
    try {
      return await _weatherListDataSource.getWeather(city, units: units);
    } catch (e) {
      return ResponseModel(
        statusCode: 510,
        message: e.toString(),
      );
    }
  }
}
