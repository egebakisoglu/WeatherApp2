class HourlyWeatherData {
  final Hourly hourly;
  HourlyWeatherData({required this.hourly});

  factory HourlyWeatherData.fromJson(Map<String, dynamic> json) =>
      HourlyWeatherData(
          hourly: Hourly.fromJson(json['hourly'])
      );
}

class Hourly {
  List? time;
  List? temp2m;
  List? weatherCode;

  Hourly({
    this.time,
    this.temp2m,
    this.weatherCode,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
    time: json['time'] as List?,
    temp2m: json['temperature_2m'] as List?,
    weatherCode: json['weathercode'] as List?,
  );

  Map<String, dynamic> toJson() => {
    'time': time,
    'temperature_2m': temp2m,
    'weathercode': weatherCode,
  };
}