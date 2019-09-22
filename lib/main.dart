import 'package:camaccess/screens/Landing.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LandingScreens(),
    );
  }
}
