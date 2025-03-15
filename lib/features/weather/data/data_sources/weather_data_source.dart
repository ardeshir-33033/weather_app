import 'package:api_handler/feature/api_handler/data/enums/header_enum.dart';
import 'package:api_handler/feature/api_handler/data/enums/response_enum.dart';
import 'package:api_handler/feature/api_handler/data/enums/result_enums.dart';
import 'package:api_handler/feature/api_handler/data/models/query_model.dart';
import 'package:api_handler/feature/api_handler/data/models/response_model.dart';
import 'package:api_handler/feature/api_handler/presentation/presentation_usecase.dart';
import 'package:weather_app/core/api_routing/weather_routing.dart';
import 'package:weather_app/core/env/environment.dart';
import 'package:weather_app/features/weather/data/models/open_weather_model.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

abstract class WeatherDataSource {
  Future<ResponseModel> getWeather(String city, {String? units});
}

class WeatherDataSourceDataSourceImpl extends WeatherDataSource {
  APIHandler api;

  WeatherDataSourceDataSourceImpl(this.api);

  @override
  Future<ResponseModel> getWeather(String city, {String? units}) async {
    try {
      ResponseModel response = await api.get(
        WeatherRouting.getWeatherRoute,
        queries: [
          QueryModel(name: "q", value: city),
          QueryModel(name: 'appid', value: Environment.apiKey),
          QueryModel(name: 'units', value: 'metric'),
        ],
        headerEnum: HeaderEnum.bearerHeaderEnum,
        responseEnum: ResponseEnum.responseModelEnum,
      );

      if (response.result == ResultEnum.success) {
        response.data = OpenWeatherModel.fromJson(response.data);
        return ResponseModel(
          data: response.data,
          result: ResultEnum.success,
        );
      } else {
        return ResponseModel(
          data: [],
          result: ResultEnum.error,
          message: response.data['message'],
        );
      }
    } catch (e) {
      return ResponseModel(
          data: [], result: ResultEnum.error, message: "ERROR");
    }
  }
}
