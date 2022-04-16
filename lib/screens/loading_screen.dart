import 'package:flutter/material.dart';

import 'package:vatavaran/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));

    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      var temperature = json.decode(data)['main']['temp'];
      print('Temperature: $temperature'); //weather[0].id
      var conditionNo = jsonDecode(data)['weather'][0]['id'];
      print('Condition: $conditionNo'); //name
      var cityName = jsonDecode(data)['name'];
      print('City: $cityName');

      //data[main.temp];
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
