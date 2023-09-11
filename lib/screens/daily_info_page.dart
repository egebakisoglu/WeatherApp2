import 'package:flutter/material.dart';

class DailyInfoPage extends StatefulWidget {
  final int pageIndex;
  final List hourlyWeather;
  final List hourlyTemp2m;
  final String date;
  final int weatherCode;
  final double maxTemp2m;
  final double minTemp2m;

  const DailyInfoPage({
    super.key,
    required this.pageIndex,
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset("assets/weather/${widget.weatherCode}.png",
                width: 80,
                height: 80,
                fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 100,
                  width: 50,
                  child: VerticalDivider(
                    color: Colors.grey[300],
                    thickness: 3,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.orange[800],
                          fontSize: 25,
                        ),
                        children: [
                          const TextSpan(text: "Max: "),
                          TextSpan(text: "${widget.maxTemp2m} °C", style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 25,
                        ),
                        children: [
                          const TextSpan(text: "Min: "),
                          TextSpan(text: "${widget.minTemp2m} °C", style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
