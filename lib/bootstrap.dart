import 'package:beer_app/injection.dart';
import 'package:beer_app/presentation/app.dart';
import 'package:flutter/material.dart';

void bootstrap() {
  configureDependencies();
  runApp(const App());
}

class Config {
  // ignore: use_setters_to_change_properties
  static void init({
    required String apiUrl,
    required int beersLimit,
  }) {
    _apiUrl = apiUrl;
    _beersLimit = beersLimit;
  }

  static late String _apiUrl;
  static late int _beersLimit;

  static String get apiUrl => _apiUrl;
  static int get beersLimit => _beersLimit;
}
