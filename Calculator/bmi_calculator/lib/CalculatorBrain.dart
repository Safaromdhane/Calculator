// ignore: file_names
import 'dart:math' show pow;

class CalculatorBrain{
  final int height;
  final int weight;
  double _bmi=0;

  CalculatorBrain(this.height, this.weight);

  String calculateBMI(){
    // ignore: non_constant_identifier_names
    _bmi = weight/pow(height /100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if (_bmi>= 25) {
      return 'Overweight';
    } else if (_bmi>18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
  String getInter(){
    if (_bmi>= 25) {
      return 'You have a higher than normal body weight, Go to the Gym and stop being lazy !';
    } else if (_bmi>18.5) {
      return 'You have a normal body weight. Respects My G';
    } else {
      return 'You have a lower than Normal body Weight. I bet you look like a skeleton...EAT!!';
    }
  }
}