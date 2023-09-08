import 'package:flutter/material.dart';
import 'package:weatherapp2/models/current_weather.dart';

class CurrentWeather extends StatelessWidget {
  final CurrentWeatherData currentWeatherData;

  const CurrentWeather({super.key, required this.currentWeatherData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      margin: EdgeInsets.only(top: 30, right: 30, left: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.asset(
              "assets/weather/${currentWeatherData.current.weatherCode}.png",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 300,
            child: Divider(
              color: Colors.grey[300],
              thickness: 3,
            ),
          ),
          Row(
            children: [
              SizedBox(width: 75),
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  "assets/thermometer.png",
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                "${currentWeatherData.current.temp} °C",
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 80),
              SizedBox(
                height: 40,
                width: 65,
                child: Image.asset(
                  "assets/windsock.png",
                ),
              ),
              Text(
                "${currentWeatherData.current.windSpeed} m/s",
                style: TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
