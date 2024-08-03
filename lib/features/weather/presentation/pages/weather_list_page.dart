import 'package:flutter/material.dart';
import 'package:weather_app/core/bases/widgets/layouts/w_scaffold.dart';
import 'package:weather_app/core/bases/widgets/molecules/w_appbar.dart';
import 'package:weather_app/features/weather/presentation/widgets/_widgets.dart';

class WeatherListPage extends StatelessWidget {
  const WeatherListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return WScaffold(
      padding: false,
      appBar: const WAppbar(
        title: 'Weather App',
        bottomContent: SearchSection(),
      ),
      appBarHeight: 0.2 * height,
      body: const WeatherListView(),
    );
  }
}
