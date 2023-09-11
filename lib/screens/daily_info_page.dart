import 'package:flutter/material.dart';

class DailyInfoPage extends StatefulWidget {
  final int pageIndex;
  final List hourlyWeather;
  final List hourlyTemp2m;
  final String date;
  final int weatherCode;
  final int maxTemp2m;
  final int minTemp2m;

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
  int listStartIndex = 0;

  @override
  void initState() {
    listStartIndex = widget.pageIndex * 24;
    super.initState();
  }

  int hourlyWeather(int index){
    double value = widget.hourlyTemp2m[listStartIndex + index];
    return value.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text(widget.date),
      ),
      body: ListView(
        children: [
          headlineContainer(),
          hourlyValues(),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  GridView hourlyValues() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 24,
      itemBuilder: (context, index){
        return Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                index < 10
                    ? "0$index:00"
                    : "$index:00",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Image.asset("assets/weather/${widget.hourlyWeather[listStartIndex + index]}.png"),
              Text(
                "${hourlyWeather(index)} °C",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  Container headlineContainer() {
    return Container(
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
        );
  }
}
