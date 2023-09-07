import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  static const String apiKey = "e158b307d0a4aae6a3c6f9eb1a9816f7";

  static Future<Map<String, dynamic>> getWeather(double lat, double lon) async {
    // final String apiUrl = "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey";
    // final String apiUrl = "http://www.7timer.info/bin/api.pl?lon=$lon&lat=$lat&product=civil&output=json";
    final String apiUrl = "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,weathercode&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&windspeed_unit=ms&timezone=auto&forecast_days=3";

    final response = await http.get(Uri.parse(apiUrl));
    return jsonDecode(response.body);
  }
}