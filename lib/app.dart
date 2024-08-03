import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/features/weather/presentation/pages/weather_list_page.dart';
import 'package:weather_app/services/navigations/_navigations.dart';

final nav = NavigationService();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      navigatorKey: nav.navigatorKey,
      home: const WeatherListPage(),
    );
  }
}
