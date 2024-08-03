import 'package:flutter/material.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/services/dependencies/di.dart';
import 'package:weather_app/services/pref_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  PrefService.init();
  runApp(const App());
}
