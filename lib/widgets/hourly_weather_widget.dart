import 'package:flutter/material.dart';
import 'package:weatherapp2/models/hourly_weather.dart';

class HourlyWeather extends StatelessWidget {
  final HourlyWeatherData hourlyWeatherData;

  HourlyWeather({super.key, required this.hourlyWeatherData});

  int currentHour = DateTime.now().hour;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top:30, left: 30),
          child: Text(
            'Today',
            style: TextStyle(
              fontSize:32,
            ),
          ),
        ),
        Container(
          height: 175,
          padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.only(left: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 24,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 1,
                      color: Colors.grey,
                      offset: Offset(4,0),
                    ),
                  ]
                ),
                child: HourlyListItem(
                  time: hourlyWeatherData.hourly.time!.elementAt(currentHour + index),
                  temp2m: hourlyWeatherData.hourly.temp2m!.elementAt(currentHour + index),
                  weatherCode: hourlyWeatherData.hourly.weatherCode!.elementAt(currentHour + index),
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          getTime(time),
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Image.asset("assets/weather/$weatherCode.png"),
        Text(
          "$temp2m °C",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
