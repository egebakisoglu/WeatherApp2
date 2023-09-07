class CurrentWeatherData {
  final Current current;
  CurrentWeatherData({required this.current});

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) => CurrentWeatherData(current: Current.fromJson(json['current_weather']));
}


class Current {
  double? temp;
  double? windSpeed;
  int? weatherCode;

  Current({
    this.temp,
    this.windSpeed,
    this.weatherCode,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    temp: json['temperature'] as double?,
    windSpeed: json['windspeed'] as double?,
    weatherCode: json['weathercode'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'temperature': temp,
    'windspeed': windSpeed,
    'weathercode': weatherCode,
  };
}