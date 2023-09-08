import 'package:weatherapp2/models/current_weather.dart';
import 'package:weatherapp2/models/hourly_weather.dart';

class WeatherData {
  final CurrentWeatherData? current;
  final HourlyWeatherData? hourly;

  WeatherData([this.current, this.hourly]);

  CurrentWeatherData getCurrentWeather() => current!;
  HourlyWeatherData getHourlyWeather() => hourly!;
}