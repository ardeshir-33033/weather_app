import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/presentation/manager/weather_cubit.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/main.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  BlocProvider<WeatherCubit>(
    create: (context) => WeatherCubit(locator()),
    child: const MyApp(),
  );
}
