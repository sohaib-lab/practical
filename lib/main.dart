import 'package:flutter/material.dart';
import 'package:practical/homepage.dart';



const Color myColor = Colors.brown;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "sohaib",
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      home: HomePage(),
    );
  }
}