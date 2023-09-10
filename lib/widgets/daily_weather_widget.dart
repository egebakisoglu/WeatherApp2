import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp2/models/daily_weather.dart';
import 'package:weatherapp2/screens/daily_info_page.dart';
import 'package:weatherapp2/models/hourly_weather.dart';

class DailyWeather extends StatelessWidget {
  final DailyWeatherData dailyWeatherData;
  final HourlyWeatherData hourlyWeatherData;

  const DailyWeather({super.key, required this.dailyWeatherData, required this.hourlyWeatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top:30, left: 30),
          child: const Text(
            'Next 7 days',
            style: TextStyle(
              fontSize:32,
            ),
          ),
        ),
        Container(
          height: 540,
          margin: const EdgeInsets.only(left: 30, right: 30, bottom: 40,top: 20),
          padding: const EdgeInsets.only(top:4),
          decoration: BoxDecoration(
            color: Colors.lightBlue[200],
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 7,
            itemBuilder: (context, index) {
              return DailyListItem(
                  date: DateTime.now().add(Duration(days: 1 + index)),
                  weatherCode: dailyWeatherData.daily.weatherCode!.elementAt(index+1),
                  maxTemp2m: dailyWeatherData.daily.maxTemp2m!.elementAt(index + 1),
                  minTemp2m: dailyWeatherData.daily.minTemp2m!.elementAt(index + 1),
                  hourly: hourlyWeatherData.hourly,
              );
            }
          ),
        ),
      ],
    );
  }
}

class DailyListItem extends StatelessWidget {
  final DateTime date;
  final int weatherCode;
  final double maxTemp2m;
  final double minTemp2m;
  final Hourly hourly;

  const DailyListItem({
    super.key,
    required this.date,
    required this.weatherCode,
    required this.maxTemp2m,
    required this.minTemp2m,
    required this.hourly,
  });

  // turn weekday integer into name of the weekday
  String findWeekDay(int weekDay) {
    switch(weekDay) {
      case 0:
        return "Sunday";
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                DailyInfoPage(
                  hourlyWeather: hourly.weatherCode!,
                  hourlyTemp2m: hourly.temp2m!,
                  date: DateFormat('MMMM d, EEEE').format(date),
                  weatherCode: weatherCode,
                  maxTemp2m: maxTemp2m,
                  minTemp2m: minTemp2m,
                )
            )
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          children: [
            // day and weekday
            Expanded(
              child: Row(
                children: [
                  Text(
                    "${date.day}, ",
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    findWeekDay(date.weekday % 7),
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

            // weather icon
            Image.asset("assets/weather/$weatherCode.png"),
            const SizedBox(width: 30),

            // maximum and minimum temperature
            Column(
              children: [
                Text(
                  "$maxTemp2m",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$minTemp2m",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

