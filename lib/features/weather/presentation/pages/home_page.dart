import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/manager/weather_cubit.dart';
import 'package:weather_app/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cityController = TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _cityController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _cityController.removeListener(_onSearchChanged);
    _cityController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(seconds: 2), () {
      final city = _cityController.text;
      if (city.isNotEmpty) {
        context.read<WeatherCubit>().getWeather(city);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                hintText: "Enter city name",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    final city = _cityController.text;
                    if (city.isNotEmpty) {
                      context.read<WeatherCubit>().getWeather(city);
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is WeatherLoadedState) {
                    final weather = state.weatherEntity;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _cityController.text,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Image.network(
                          'https://openweathermap.org/img/wn/${weather.weather!.first.icon}@2x.png',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          weather.weather!.first.main!,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text("Temp: ${weather.main!.temp}°C"),
                        Text("Humidity: ${weather.main!.humidity}%"),
                        Text("Wind: ${weather.wind!.speed} m/s"),
                      ],
                    );
                  } else if (state is WeatherError) {
                    return Center(
                        child: Text(state.error,
                            style: TextStyle(color: Colors.red)));
                  }
                  return Center(
                      child: Text("Enter a city to get weather info"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
