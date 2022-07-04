import 'package:flutter/material.dart';
import './input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue,
        accentColor: Colors.pinkAccent,
        scaffoldBackgroundColor: Colors.lightBlue,
      ),
      home: InputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

