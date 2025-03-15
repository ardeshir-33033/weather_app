// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:api_handler/feature/api_handler/presentation/presentation_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/env/environment.dart';
import 'package:weather_app/locator.dart';

import './step/the_app_is_running.dart';
import './step/i_see_icon.dart';
import './step/i_see_text.dart';

void main() {
  setUpAll(() async {
    await Environment.initEnvironment();
    setup();
  });

  group('''Get Weather''', () {
    testWidgets('''Opening the app and seeing basic app ui''', (tester) async {
      await theAppIsRunning(tester);
      await tester.pumpAndSettle();
      // await iSeeText(tester, "Weather App");
    });
  });
}
