import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/env/environment.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import '../../../../../fixtures/test_models/t_weather_model.dart';
import '../data_sources/weather_data_source_test.mocks.dart';

@GenerateMocks([WeatherRepository])
void main() {
  late MockWeatherDataSource mockWeatherListDataSource;
  late WeatherRepositoryImpl repository;

  setUp(() async {
    await Environment.initEnvironment();

    mockWeatherListDataSource = MockWeatherDataSource();
    repository = WeatherRepositoryImpl(mockWeatherListDataSource);
  });

  group('get Weather list', () {
    final tWeatherList = TestModels.testModelForGetWeatherResponse;

    test(
      'should return ResponseModel of Weather when getting data is successful',
      () async {
        //arrange
        when(mockWeatherListDataSource.getWeather("Tehran"))
            .thenAnswer((realInvocation) async => tWeatherList);
        //act
        final result = await repository.getWeather("Tehran");
        //assert
        verify(mockWeatherListDataSource.getWeather("Tehran"));
        expect(result, equals(tWeatherList));
      },
    );

    // test(
    //   'should return Exception when get transactions is not successful',
    //   () async {
    //     //arrange
    //     when(mockTransactionListDataSource.getTransactionList(1, 20))
    //         .thenThrow(Exception(""));
    //     //act
    //     final call = repository.getTransactionList;
    //     //assert
    //     expect(() => call(1, 20), throwsA(const TypeMatcher<Exception>()));
    //   },
    // );
  });
}
