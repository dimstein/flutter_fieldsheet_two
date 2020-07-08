import 'package:flutter/material.dart';
import 'package:flutter_fieldsheet/landing_page.dart';
//import 'package:flutter_fieldsheet/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String appTitle = 'Fieldsheet app';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(appTitle: appTitle),
    );
  }
}
