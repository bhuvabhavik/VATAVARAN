import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:vatavaran/services/location.dart';
import 'package:vatavaran/services/networking.dart';

const apiKey = 'a94cb8803247134d2b5adab7580dec68';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  // //late String temperature;
  // late String conditionNo;
  // late String city;

  @override
  void initState() {
    super.initState();
    print('entered init bro');
    getlocation();
  }

  void getlocation() async {
    Location locationInstance = Location();

    await locationInstance.getCurrentLocation();
    latitude = locationInstance.latitude;
    longitude = locationInstance.longitude;

    getWeather();
    print('your current position:\n'
        ' latitude: $latitude \n '
        'longitude: $longitude');
  }

  Future<void> getWeather() async {
    NetworkingHelper networkingHelper = NetworkingHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = networkingHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
