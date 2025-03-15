import 'dart:io';

String fixture(String name) => File('test/fixtures/jsons/$name').readAsStringSync();