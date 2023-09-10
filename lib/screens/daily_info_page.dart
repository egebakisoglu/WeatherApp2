import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp2/models/hourly_weather.dart';

class DailyInfoPage extends StatefulWidget {
  final HourlyWeatherData hourlyOfDailyWeather;
  final int pageIndex;

  DailyInfoPage({
    super.key,
    required this.hourlyOfDailyWeather,
    required this.pageIndex,
  });

  @override
  State<DailyInfoPage> createState() => _DailyInfoPageState();
}

class _DailyInfoPageState extends State<DailyInfoPage> {
  int index = 0;
  String date = "";

  @override
  void initState() {
    super.initState();

    index = widget.pageIndex;
    date = DateFormat('MMMM d, EEEE').format(DateTime.now().add(Duration(days: index)));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text(date),
      ),
    );
  }
}
