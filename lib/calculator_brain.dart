import 'dart:math';
import 'package:bmi_calculator/screens/intro_page.dart';

class CalculatorBrain {
  CalculatorBrain({
    this.height,
    this.weight,
    this.unit,
  });

  final int height;
  final int weight;
  final Units unit;

  double _bmi;

  String calculateBMI() {
    //imperial way of calculating BMI
    if (unit == Units.imperial) {
      _bmi = 703 * (weight / pow(height, 2));
    } else {
      _bmi = weight / pow((height / 100), 2);
    }
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi > 30) {
      return 'Obese';
    } else if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi > 30) {
      return 'Please see your doctor';
    } else if (_bmi > 25) {
      return 'Try to execise and diet. Please see your doctor for more info.';
    } else if (_bmi > 18.5) {
      return 'Your body weight is normal. Keep it up!';
    } else {
      return 'Eat more and exercise less. Please see your doctor for more info.';
    }
  }
}
