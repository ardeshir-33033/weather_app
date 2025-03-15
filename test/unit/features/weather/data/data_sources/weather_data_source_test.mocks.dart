// Mocks generated by Mockito 5.4.5 from annotations
// in weather_app/test/unit/features/weather/data/data_sources/weather_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:api_handler/feature/api_handler/data/models/response_model.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:weather_app/features/weather/data/data_sources/weather_data_source.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponseModel_0 extends _i1.SmartFake implements _i2.ResponseModel {
  _FakeResponseModel_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [WeatherDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherDataSource extends _i1.Mock implements _i3.WeatherDataSource {
  MockWeatherDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ResponseModel> getWeather(String? city, {String? units}) =>
      (super.noSuchMethod(
            Invocation.method(#getWeather, [city], {#units: units}),
            returnValue: _i4.Future<_i2.ResponseModel>.value(
              _FakeResponseModel_0(
                this,
                Invocation.method(#getWeather, [city], {#units: units}),
              ),
            ),
          )
          as _i4.Future<_i2.ResponseModel>);
}
