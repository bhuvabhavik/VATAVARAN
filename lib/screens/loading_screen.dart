import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:vatavaran/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String s_url =
      'https://samples.openweathermap.org/data/2.5/heather?lat=23&lon=69&appid=b6907d289e10d714a6e88b30761fae22';

  @override
  void initState() {
    super.initState();
    print('entered init bro');
    getlocation();
  }

  void getlocation() async {
    Location locationInstance = Location();
    await locationInstance.getCurrentLocation();
    print(locationInstance.latitude);
    print(locationInstance.longitude);

    getWeather();
    // print('your current position:\n'
    //     ' latitude: $locationInstance.latitude \n '
    //     'longitude: $locationInstance.longitude');
  }

  Future<void> getWeather() async {
    http.Response response = await http.get(Uri.parse(s_url));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
