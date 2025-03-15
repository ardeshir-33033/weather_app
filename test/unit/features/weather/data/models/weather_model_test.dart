import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/data/models/open_weather_model.dart';
import 'package:weather_app/features/weather/domain/entities/open_weather_entity.dart';
import '../../../../../fixtures/fixture_reader.dart';
import '../../../../../fixtures/test_models/t_weather_model.dart';

void main() {
  final tWeatherModel = TestModels.testModelForWeather;

  test(
    'should be a subclass of weather entity',
    () async {
      //assert
      expect(tWeatherModel, isA<OpenWeatherEntity>());
    },
  );

  group('from json', () {
    test(
      'should return a valid model',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture("get_weather_json.json"));
        //act
        OpenWeatherModel result = OpenWeatherModel.fromJson(jsonMap);
        //assert
        expect(result, isA<OpenWeatherModel>());
      },
    );
  });
}
