import 'package:api_handler/feature/api_handler/data/models/response_model.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherUsecase
    implements UseCase<Future<ResponseModel>, GetWeatherParams> {
  final WeatherRepository weatherRepository;

  GetWeatherUsecase(this.weatherRepository);

  @override
  Future<ResponseModel> call(GetWeatherParams params) {
    return weatherRepository.getWeather(
      params.city,
      units: params.unit,
    );
  }
}

class GetWeatherParams {
  String city;
  String? unit;

  GetWeatherParams({
    required this.city,
    this.unit,
  });
}
