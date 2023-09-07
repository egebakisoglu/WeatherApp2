import 'package:weatherapp2/models/current_weather.dart';

class WeatherData {
  final CurrentWeatherData? currentWeatherData;

  WeatherData([this.currentWeatherData]);

  CurrentWeatherData getCurrentWeather() => currentWeatherData!;
}