import 'package:flutter/material.dart';
import 'package:vatavaran/screens/city_screen.dart';
import 'package:vatavaran/screens/loading_screen.dart';
import 'package:vatavaran/screens/location_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
