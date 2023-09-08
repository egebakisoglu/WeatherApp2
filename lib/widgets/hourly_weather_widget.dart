import 'package:flutter/material.dart';
import 'package:weatherapp2/models/hourly_weather.dart';

class HourlyWeather extends StatelessWidget {
  final HourlyWeatherData hourlyWeatherData;

  const HourlyWeather({super.key, required this.hourlyWeatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top:30, left: 30, bottom: 30),
          child: Text(
            'Today',
            style: TextStyle(
              fontSize:32,
            ),
          ),
        ),
        Container(
          height: 150,
          padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.only(left: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 24,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 1,
                      color: Colors.grey,
                      offset: Offset(1,0),
                    ),
                  ]
                ),
                child: HourlyListItem(
                  time: hourlyWeatherData.hourly.time!.elementAt(index),
                  temp2m: hourlyWeatherData.hourly.temp2m!.elementAt(index),
                  weatherCode: hourlyWeatherData.hourly.weatherCode!.elementAt(index),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class HourlyListItem extends StatelessWidget {
  final String time;
  final double temp2m;
  final int weatherCode;

  const HourlyListItem({
    super.key,
    required this.time,
    required this.temp2m,
    required this.weatherCode,
  });

  String getTime(String time){
    List date = time.split("T");
    return date[1];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(getTime(time)),
        Image.asset("assets/weather/$weatherCode.png"),
        Text("$temp2m"),
      ],
    );
  }
}
