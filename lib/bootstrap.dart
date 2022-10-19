import 'package:beer_app/presentation/app.dart';
import 'package:flutter/material.dart';

void bootstrap() {
  runApp(const App());
}

class Config {
  // ignore: use_setters_to_change_properties
  static void init({
    required String apiUrl,
  }) {
    _apiUrl = apiUrl;
  }

  static late String _apiUrl;

  static String get apiUrl => _apiUrl;
}
