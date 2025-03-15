import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:weather_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tests if we can successfully load data and transactions list',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final textFieldFinder = find.byKey(const Key('TextField'));
      expect(textFieldFinder, findsOneWidget);

      await tester.enterText(textFieldFinder, 'London');
      await tester.pumpAndSettle();

      expect(find.text('London'), findsOneWidget);
      await Future.delayed(Duration(seconds: 4));
      await tester.pumpAndSettle();
      expect(find.byKey(Key("Got Weather")), findsOneWidget);
    });
  });
}
