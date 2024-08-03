part of '_widgets.dart';

class WeatherListView extends StatelessWidget {
  final List<WeatherModel> weathers;
  final String location;
  const WeatherListView({
    required this.weathers,
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      itemCount: weathers.length + 1,
      separatorBuilder: (context, index) => const SizedBox(
        height: 12,
      ),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text(
            'Showing Weather Forecast in $location',
            style: FontTheme.subHeader3,
          );
        }
        final weather = weathers[index - 1];

        return InkWell(
          onTap: () => nav.push(
            WeatherDetailPage(
              weather: weather,
              location: location,
            ),
          ),
          child: WeatherCard(
            time: DateService.formatDate(weather.time),
            condition: weather.main,
            temp: weather.temp,
            icon: weather.icon,
          ),
        );
      },
    );
  }
}
