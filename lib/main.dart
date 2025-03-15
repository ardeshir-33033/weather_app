import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/env/environment.dart';
import 'package:weather_app/features/weather/presentation/manager/weather_cubit.dart';
import 'package:weather_app/features/weather/presentation/pages/home_page.dart';

import 'locator.dart';

void main() async {
  await Environment.initEnvironment();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => WeatherCubit(locator()),
        child: HomePage(),
      ),
    );
  }
}
