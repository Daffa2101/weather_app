part of '_widgets.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.sunny),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tue, 22 Jul 2022, 03:00 PM ',
                style: FontTheme.subHeader3,
              ),
              Text(
                'Sunny',
                style: FontTheme.body4,
              ),
              Text(
                'Temp: 29 °C',
                style: FontTheme.body4,
              )
            ],
          )
        ],
      ),
    );
  }
}