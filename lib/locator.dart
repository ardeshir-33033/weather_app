import 'package:api_handler/feature/api_handler/presentation/presentation_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather/data/data_sources/weather_data_source.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/use_cases/get_weather_usecase.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<APIHandler>(() => APIHandler());

  locator.registerLazySingleton<WeatherDataSource>(
      () => WeatherDataSourceDataSourceImpl(locator()));

  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(locator()));

  locator.registerLazySingleton<GetWeatherUsecase>(
      () => GetWeatherUsecase(locator()));
  //
  // locator.registerLazySingleton<TransactionListProvider>(
  //     () => TransactionListProvider(locator()));
}
