import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp2/controller/global_controller.dart';
import 'package:weatherapp2/widgets/city_headline.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  
  // call globalcontroller for location
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() =>
          globalController.checkLoading().isTrue
          ? const Center(
            child: CircularProgressIndicator(),
          )
          : Container(
            child: ListView(
              children: [
                CityHeadline(),
              ],
            ),
          )
        ),
      ),
    );
  }
}
