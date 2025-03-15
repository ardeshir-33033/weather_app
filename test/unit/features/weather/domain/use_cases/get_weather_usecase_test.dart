import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/env/environment.dart';
import 'package:weather_app/features/weather/domain/use_cases/get_weather_usecase.dart';

import '../../../../../fixtures/test_models/t_weather_model.dart';
import '../../data/repositories/weather_repository_impl_test.mocks.dart';

@GenerateMocks([GetWeatherUsecase])
void main() {
  late GetWeatherUsecase getWeatherUsecase;
  late MockWeatherRepository mockWeatherRepository;

  setUpAll(() async {
    await Environment.initEnvironment();

    mockWeatherRepository = MockWeatherRepository();
    getWeatherUsecase = GetWeatherUsecase(mockWeatherRepository);
  });

  final tWeatherList = TestModels.testModelForGetWeatherResponse;

  test(
    'should get Weather list from repository',
    () async {
      //arrange
      when(mockWeatherRepository.getWeather("Tehran"))
          .thenAnswer((_) async => tWeatherList);
      //act
      final result = await getWeatherUsecase(GetWeatherParams(city: "Tehran"));
      //assert
      expect(result, tWeatherList);
      verify(mockWeatherRepository.getWeather("Tehran"));
      verifyNoMoreInteractions(mockWeatherRepository);
    },
  );
}
