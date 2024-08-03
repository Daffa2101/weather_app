import 'package:flutter/material.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/core/bases/widgets/layouts/w_scaffold.dart';
import 'package:weather_app/core/bases/widgets/molecules/w_appbar.dart';
import 'package:weather_app/core/themes/_themes.dart';

class WeatherDetailPage extends StatelessWidget {
  const WeatherDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return WScaffold(
      padding: false,
      backgroundColor: Colors.blue.shade100,
      appBar: WAppbar(
        title: 'Weather Details',
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            nav.pop();
          },
        ),
      ),
      appBarHeight: 0.1 * height,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade100,
                Colors.white,
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'Monas',
                      style: FontTheme.header2,
                    ),
                    const Text(
                      '',
                      style: FontTheme.subHeader2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '29°C',
                          style: FontTheme.subHeader1.copyWith(fontSize: 56),
                        ),
                        const Icon(
                          Icons.sunny_snowing,
                          size: 56,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Clouds (little cloud)',
                      style: FontTheme.subHeader3,
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherDetailsDataCard(
                          title: 'Temp (min)',
                          data: '29°C',
                        ),
                        WeatherDetailsDataCard(
                          title: 'Temp (max)',
                          data: '29°C',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherDetailsDataCard(
                          title: 'Pressure',
                          data: '29 hPa',
                        ),
                        WeatherDetailsDataCard(
                          title: 'Sea Level',
                          data: '20 hPa',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherDetailsDataCard(
                          title: 'Ground level',
                          data: '200 hPa',
                        ),
                        WeatherDetailsDataCard(
                          title: 'Humidity',
                          data: '55 %',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherDetailsDataCard extends StatelessWidget {
  final String title;
  final String data;
  const WeatherDetailsDataCard({
    required this.title,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: 0.4 * width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(
              0.5,
            ),
          ),
          borderRadius: BorderRadius.circular(
            12,
          )),
      child: Column(
        children: [
          Text(
            title,
            style: FontTheme.body4,
          ),
          Text(
            data,
            style: FontTheme.header4,
          ),
        ],
      ),
    );
  }
}
