part of '_widgets.dart';

class WeatherCard extends StatelessWidget {
  final String time;
  final String condition;
  final double temp;
  final String icon;

  const WeatherCard({
    required this.time,
    required this.condition,
    required this.temp,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
          color: Colors.grey.shade400.withOpacity(0.5),
          borderRadius: BorderRadius.circular(
            16,
          ),
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            'https://openweathermap.org/img/wn/$icon@2x.png',
            errorBuilder: (context, error, stackTrace) {
              return const Text(
                'No Connection',
              );
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: FontTheme.subHeader3,
              ),
              Text(
                condition,
                style: FontTheme.body4,
              ),
              Text(
                'Temp: $temp °C',
                style: FontTheme.body4,
              )
            ],
          )
        ],
      ),
    );
  }
}
