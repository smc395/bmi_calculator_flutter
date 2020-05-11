import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({
    this.height,
    this.weight,
  });

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    //imperial way of calculating BMI
    _bmi = 703 * (weight / pow(height, 2));
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
