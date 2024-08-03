import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/bases/widgets/layouts/w_scaffold.dart';
import 'package:weather_app/core/bases/widgets/molecules/w_appbar.dart';
import 'package:weather_app/core/themes/_themes.dart';
import 'package:weather_app/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_app/features/weather/presentation/widgets/_widgets.dart';
import 'package:weather_app/services/dependencies/di.dart';

class WeatherListPage extends StatefulWidget {
  const WeatherListPage({super.key});

  @override
  State<WeatherListPage> createState() => _WeatherListPageState();
}

class _WeatherListPageState extends State<WeatherListPage> {
  late WeatherCubit _weatherCubit;

  @override
  void initState() {
    super.initState();
    _weatherCubit = di.get<WeatherCubit>();
    _weatherCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return WScaffold(
      padding: false,
      appBar: WAppbar(
        title: 'Weather App',
        bottomContent: SearchSection(
          cubit: _weatherCubit,
        ),
      ),
      appBarHeight: 0.2 * height,
      body: BlocBuilder<WeatherCubit, WeatherState>(
        bloc: _weatherCubit,
        builder: (context, state) {
          if (state.isLoaded) {
            return WeatherListView(
              weathers: state.weathers!,
              location: state.location!,
            );
          }

          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }

          if (state.isError) {
            return Center(
              child: Text(
                state.errorMsg!,
                style: FontTheme.subHeader3,
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
