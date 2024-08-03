import 'package:flutter/material.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/core/bases/widgets/layouts/w_scaffold.dart';
import 'package:weather_app/core/bases/widgets/molecules/w_appbar.dart';
import 'package:weather_app/core/themes/_themes.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/services/date_service.dart';

class WeatherDetailPage extends StatelessWidget {
  final WeatherModel weather;
  final String location;
  const WeatherDetailPage({
    required this.weather,
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
                    Text(
                      location,
                      style: FontTheme.header2,
                    ),
                    Text(
                      DateService.formatDate(weather.time),
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
                          '${weather.temp}°C',
                          style: FontTheme.subHeader1.copyWith(fontSize: 56),
                        ),
                        Image.network(
                          'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '${weather.main} (${weather.description})',
                      style: FontTheme.subHeader3,
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherDetailsDataCard(
                          title: 'Temp (min)',
                          data: '${weather.tempMin}°C',
                        ),
                        WeatherDetailsDataCard(
                          title: 'Temp (max)',
                          data: '${weather.tempMax}°C',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherDetailsDataCard(
                          title: 'Pressure',
                          data: '${weather.tempMin} hPa',
                        ),
                        WeatherDetailsDataCard(
                          title: 'Sea Level',
                          data: '${weather.tempMin} hPa',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 0.4 * width,
                          padding:
                              const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                              const Text(
                                'Ground Level',
                                style: FontTheme.body4,
                              ),
                              Text(
                                '${weather.grndLevel} hPa',
                                style: FontTheme.header4,
                              ),
                            ],
                          ),
                        ),
                        WeatherDetailsDataCard(
                          title: 'Humidity',
                          data: '${weather.humidity} %',
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
