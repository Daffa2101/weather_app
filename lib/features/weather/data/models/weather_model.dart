class WeatherModel {
  late DateTime time;
  late int id;
  late String main;
  late String description;
  late String icon;
  late double temp;
  late double tempMin;
  late double tempMax;
  late double pressure;
  late double seaLevel;
  late double grndLevel;
  late double humidity;

  WeatherModel({
    required this.time,
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    time = DateTime.fromMillisecondsSinceEpoch(
      (json['dt'] as int) * 1000,
      isUtc: true,
    );
    id = json['weather'][0]['id'] as int;
    main = json['weather'][0]['main'] as String;
    description = json['weather'][0]['description'] as String;
    icon = json['weather'][0]['icon'] as String;
    temp = (json['main']['temp'] as num).toDouble();
    tempMin = (json['main']['temp_min'] as num).toDouble();
    tempMax = (json['main']['temp_max'] as num).toDouble();
    pressure = (json['main']['pressure'] as num).toDouble();
    seaLevel = (json['main']['sea_level'] as num).toDouble();
    grndLevel = (json['main']['grnd_level'] as num).toDouble();
    humidity = (json['main']['humidity'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    return {
      'dt': time.millisecondsSinceEpoch ~/ 1000,
      'weather': [
        {
          'id': id,
          'main': main,
          'description': description,
          'icon': icon,
        }
      ],
      'main': {
        'temp': temp,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure.toInt(),
        'sea_level': seaLevel.toInt(),
        'grnd_level': grndLevel.toInt(),
        'humidity': humidity.toInt(),
      }
    };
  }
}
