import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp2/api/weather_api.dart';
import 'package:weatherapp2/models/weather_data.dart';

class GlobalController extends GetxController{
  // variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  // instance
  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;

  WeatherData getWeatherData() => weatherData.value;

  @override
  void onInit() {
    if(_isLoading.isTrue){
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    // if service is not enabled
    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }

    // permission status
    permission = await Geolocator.checkPermission();

    // request permission
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied, cannot request permission");
    }

    // if location is enabled
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high)
      .then((value) {
        // get latitude and longitude
        _latitude.value = value.latitude;
        _longitude.value = value.longitude;

        // call api
        return WeatherApi().getWeather(value.latitude, value.longitude)
          .then((value) {
            weatherData.value = value;
          _isLoading.value = false;
        });
      }
    );
  }
}