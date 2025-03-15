import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/env/environment.dart';
import 'package:weather_app/features/weather/data/data_sources/weather_data_source.dart';

import '../../../../../fixtures/test_models/t_weather_model.dart';
import 'weather_data_source_test.mocks.dart';

@GenerateMocks([WeatherDataSource])
void main() {
  late WeatherDataSource dataSource;

  setUp(() async {
    await Environment.initEnvironment();
    dataSource = MockWeatherDataSource();
  });

  group('get weather data source', () {
    final tWeather = TestModels.testModelForGetWeatherResponse;

    test(
      'should return a weather list when get is successful',
      () async {
        //arrange
        when(dataSource.getWeather("Tehran"))
            .thenAnswer((realInvocation) async => tWeather);
        //act
        final result = await dataSource.getWeather("Tehran");
        //assert
        verify(dataSource.getWeather("Tehran"));
        expect(result, equals(tWeather));
      },
    );

    test(
      'should return Exception when get weather is not successful',
      () async {
        //arrange
        when(dataSource.getWeather("Tehran")).thenThrow(Exception());
        //act
        final call = dataSource.getWeather;
        //assert
        expect(() => call("Tehran"), throwsA(const TypeMatcher<Exception>()));
      },
    );
  });
}
