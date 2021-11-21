import 'dart:math';

class CalculateBrain {
  final int height;
  final int weight;
  double _bmi;

  CalculateBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1); //رقم بعد الفاصلة
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Over weight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Under weight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
