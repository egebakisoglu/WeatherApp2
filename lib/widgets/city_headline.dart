import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp2/controller/global_controller.dart';
import 'package:get/get.dart';

class CityHeadline extends StatefulWidget {
  const CityHeadline({super.key});

  @override
  State<CityHeadline> createState() => _CityHeadlineState();
}

class _CityHeadlineState extends State<CityHeadline> {
  String city = "";
  String date = DateFormat.yMMMMEEEEd().format(DateTime.now());
  final GlobalController globalController = 
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLatitude().value, globalController.getLongitude().value);
    super.initState();
  }

  getAddress(latitude, longitude) async {
    List <Placemark> placemark = await placemarkFromCoordinates(latitude, longitude);
    Placemark location = placemark[0];
    setState(() {
      city = location.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.topCenter,
          child: Text(
            city,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Text(date),
      ],
    );
  }
}
