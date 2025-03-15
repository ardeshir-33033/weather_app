import 'package:api_handler/api_handler.dart';
import 'package:api_handler/feature/api_handler/data/models/response_model.dart';
import 'package:weather_app/features/weather/data/models/open_weather_model.dart';
import 'package:weather_app/features/weather/data/models/weather_main_model.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

class TestModels {
  static final testModelForWeather = OpenWeatherModel(
    main: WeatherMainModel(
      temp: 18.73,
      feelsLike: 17.15,
      tempMin: 18.73,
      tempMax: 18.99,
      pressure: 1023,
      humidity: 19,
      seaLevel: 1023,
      grndLevel: 870,
    ),
  );

  static final testModelForGetWeatherResponse = ResponseModel(
    data: [testModelForWeather],
    statusCode: 200,
    result: ResultEnum.success,
    message: "OK",
  );
}
