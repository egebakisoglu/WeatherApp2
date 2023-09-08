import 'package:weatherapp2/models/current_weather.dart';
import 'package:weatherapp2/models/hourly_weather.dart';
import 'package:weatherapp2/models/daily_weather.dart';

class WeatherData {
  final CurrentWeatherData? current;
  final HourlyWeatherData? hourly;
  final DailyWeatherData? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  CurrentWeatherData getCurrentWeather() => current!;
  HourlyWeatherData getHourlyWeather() => hourly!;
  DailyWeatherData getDailyWeather() => daily!;
}