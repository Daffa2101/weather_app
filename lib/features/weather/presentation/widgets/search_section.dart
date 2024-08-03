part of '_widgets.dart';

class SearchSection extends StatefulWidget {
  final WeatherCubit cubit;
  const SearchSection({
    required this.cubit,
    super.key,
  });

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WTextfield(
          width: 0.75 * MediaQuery.of(context).size.width,
          controller: _searchController,
          hintText: 'See weather in other cities...',
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () => _searchController.text.isNotEmpty
                ? widget.cubit.fetchForecastData(
                    _searchController.text,
                  )
                : widget.cubit.fetchForecastData(null),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
