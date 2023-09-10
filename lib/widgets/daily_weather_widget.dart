import 'package:flutter/material.dart';
import 'package:weatherapp2/models/daily_weather.dart';
import 'package:weatherapp2/screens/daily_info_page.dart';
import 'package:weatherapp2/models/hourly_weather.dart';

class DailyWeather extends StatelessWidget {
  final DailyWeatherData dailyWeatherData;
  final HourlyWeatherData hourlyWeatherData;

  DailyWeather({super.key, required this.dailyWeatherData, required this.hourlyWeatherData});

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
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        DailyInfoPage(
                          hourlyOfDailyWeather: hourlyWeatherData,
                          pageIndex: index + 1,
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
                  child: DailyListItem(
                    weekDay: (DateTime.now().weekday + index + 1) % 7,
                    date: DateTime.now().day + index + 1,
                    weatherCode: dailyWeatherData.daily.weatherCode!.elementAt(index+1),
                    maxTemp2m: dailyWeatherData.daily.maxTemp2m!.elementAt(index + 1),
                    minTemp2m: dailyWeatherData.daily.minTemp2m!.elementAt(index + 1),
                  ),
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}

class DailyListItem extends StatelessWidget {
  final int weekDay;
  final int date;
  final int weatherCode;
  final double maxTemp2m;
  final double minTemp2m;

  const DailyListItem({
    super.key,
    required this.weekDay,
    required this.date,
    required this.weatherCode,
    required this.maxTemp2m,
    required this.minTemp2m
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
    return Row(
      children: [
        // day and weekday
        Expanded(
          child: Row(
            children: [
              Text(
                "$date, ",
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                findWeekDay(weekDay),
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
    );
  }
}

