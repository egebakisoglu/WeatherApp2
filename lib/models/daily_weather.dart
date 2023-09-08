class DailyWeatherData {
  final Daily daily;
  DailyWeatherData({required this.daily});
  
  factory DailyWeatherData.fromJson(Map<String, dynamic> json) =>
      DailyWeatherData(
          daily: Daily.fromJson(json['daily'])
      );
}

class Daily {
  List? weatherCode;
  List? maxTemp2m;
  List? minTemp2m;

  Daily({
    this.weatherCode,
    this.maxTemp2m,
    this.minTemp2m,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
    weatherCode: json['weathercode'] as List?,
    maxTemp2m: json['temperature_2m_max'] as List?,
    minTemp2m: json['temperature_2m_min'] as List?,
  );

  Map<String, dynamic> toJson() => {
    'weathercode': weatherCode,
    'temperature_2m_max': maxTemp2m,
    'temperature_2m_min': minTemp2m,
  };
}