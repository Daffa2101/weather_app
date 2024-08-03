part of '_widgets.dart';

class WeatherListView extends StatelessWidget {
  const WeatherListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      itemCount: 5 + 1,
      separatorBuilder: (context, index) => const SizedBox(
        height: 12,
      ),
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Text(
            'Showing Weather Forecast in Monas',
            style: FontTheme.subHeader3,
          );
        }

        return InkWell(
          onTap: () => nav.push(
            const WeatherDetailPage(),
          ),
          child: const WeatherCard(),
        );
      },
    );
  }
}
