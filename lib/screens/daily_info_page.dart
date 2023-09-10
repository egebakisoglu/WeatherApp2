import 'package:flutter/material.dart';

class DailyInfoPage extends StatefulWidget {
  final List hourlyWeather;
  final List hourlyTemp2m;
  final String date;
  final int weatherCode;
  final double maxTemp2m;
  final double minTemp2m;

  const DailyInfoPage({
    super.key,
    required this.hourlyWeather,
    required this.hourlyTemp2m,
    required this.date,
    required this.weatherCode,
    required this.maxTemp2m,
    required this.minTemp2m,
  });

  @override
  State<DailyInfoPage> createState() => _DailyInfoPageState();
}

class _DailyInfoPageState extends State<DailyInfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text(widget.date),
      ),
    );
  }
}
