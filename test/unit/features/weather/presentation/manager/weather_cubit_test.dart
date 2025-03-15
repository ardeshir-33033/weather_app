// import 'package:api_handler/feature/api_handler/data/models/response_model.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:weather_app/core/env/environment.dart';
// import 'package:weather_app/features/weather/domain/entities/open_weather_entity.dart';
// import 'package:weather_app/features/weather/domain/entities/weather_main_entity.dart';
// import 'package:weather_app/features/weather/domain/use_cases/get_weather_usecase.dart';
// import 'package:weather_app/features/weather/presentation/manager/weather_cubit.dart';
// import 'package:weather_app/locator.dart';
//
// import '../../domain/use_cases/get_weather_usecase_test.mocks.dart';
//
// @GenerateMocks([WeatherCubit])
// void main() {
//   late WeatherCubit weatherCubit;
//   late MockGetWeatherUsecase mockGetWeatherUsecase;
//
//   setUp(() {
//     mockGetWeatherUsecase = MockGetWeatherUsecase();
//     weatherCubit = WeatherCubit(mockGetWeatherUsecase);
//   });
//
//   tearDown(() {
//     weatherCubit.close();
//   });
//
//   const testCity = "London";
//   final testWeatherEntity = OpenWeatherEntity(
//     main: WeatherMainEntity(
//       tempMax: 20.0,
//       tempMin: 10.0,
//       humidity: 50,
//     ),
//   );
//
//   blocTest<WeatherCubit, WeatherState>(
//     'emits [WeatherLoadedState] when getWeather is successful',
//     build: () {
//       when(() => mockGetWeatherUsecase(any()))
//           .thenAnswer((_) async => Future.value(ApiResponse.success(testWeatherEntity)));
//       return weatherCubit;
//     },
//     act: (cubit) => cubit.getWeather(testCity),
//     expect: () => [WeatherLoadedState(testWeatherEntity)],
//   );
//   //
//   // blocTest<WeatherCubit, WeatherState>(
//   //   'emits [WeatherError] when getWeather fails',
//   //   build: () {
//   //     when(() => mockGetWeatherUsecase(GetWeatherParams(city: testCity)))
//   //         .thenAnswer(
//   //             (_) async => ApiResponse.error("Failed to fetch weather"));
//   //     return weatherCubit;
//   //   },
//   //   act: (cubit) => cubit.getWeather(testCity),
//   //   expect: () => [WeatherError(error: "Failed to fetch weather")],
//   // );
//
//   // blocTest<WeatherCubit, WeatherState>(
//   //   'emits [WeatherError] when an exception occurs',
//   //   build: () {
//   //     when(() => mockGetWeatherUsecase(GetWeatherParams(city: testCity)))
//   //         .thenThrow(Exception("Unexpected error"));
//   //     return weatherCubit;
//   //   },
//   //   act: (cubit) => cubit.getWeather,
//   //   expect: () => [WeatherError(error: "Exception: Unexpected error")],
//   // );
//   // late WeatherCubit weatherCubit;
//   // late MockGetWeatherUsecase mockGetWeatherUsecase;
//   //
//   // setUpAll(() async {
//   //   await Environment.initEnvironment();
//   //   setup();
//   //   // EquatableConfig.stringify = true;
//   //   mockGetWeatherUsecase = MockGetWeatherUsecase();
//   //   weatherCubit = WeatherCubit(mockGetWeatherUsecase);
//   // });
//   //
//   group(WeatherCubit, () {
//     blocTest<WeatherCubit, WeatherState>(
//       'when cubit is created the weather should be null',
//       build: () => WeatherCubit(mockGetWeatherUsecase),
//       act: (cubit) => cubit.getWeather("Tehran"),
//       // verify: (cubit) => expect(cubit.state, WeatherLoadedState),
//       expect: () => [WeatherError],
//     );
//   });
// }
