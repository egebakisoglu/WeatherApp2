import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp2/models/current_weather.dart';
import 'package:weatherapp2/models/daily_weather.dart';
import 'package:weatherapp2/models/hourly_weather.dart';
import 'package:weatherapp2/models/weather_data.dart';

class WeatherApi {
  WeatherData? weatherData;

  Future<WeatherData> getWeather(double lat, double lon) async {
    final String apiUrl = "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,weathercode&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&windspeed_unit=ms&timezone=auto&forecast_days=8";
    final response = await http.get(Uri.parse(apiUrl));

    final jsonString = jsonDecode(response.body);

    weatherData = WeatherData(CurrentWeatherData.fromJson(jsonString),
        HourlyWeatherData.fromJson(jsonString),
        DailyWeatherData.fromJson(jsonString)
    );

    return weatherData!;
  }
}