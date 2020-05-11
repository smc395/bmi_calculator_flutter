import 'package:bmi_calculator/screens/intro_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  Color darkPurpleColor = Color(0xFF0A0E21);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: darkPurpleColor,
        scaffoldBackgroundColor: darkPurpleColor,
      ),
      home: IntroPage(),
    );
  }
}
