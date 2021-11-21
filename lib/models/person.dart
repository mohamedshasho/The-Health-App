import 'package:shared_preferences/shared_preferences.dart';
import 'package:thehealths/data/calculate_brain.dart';

class Person {
  String name;
  String age;
  String height;
  String weight;
  CalculateBrain bmi;
  String gender;
  // SharedPreferences sh;
  //Person({this.name, this.age});
  SharedPreferences sh;
  getRef() async {
    sh = await SharedPreferences.getInstance();
  }

  Person({SharedPreferences sharedPreferences}) {
    name = sharedPreferences.getString('name');
    age = sharedPreferences.getString('age');
    height = sharedPreferences.getString('height');
    weight = sharedPreferences.getString('weight');
    gender = sharedPreferences.getString('gender');
    if (height != null && weight != null)
      bmi =
          CalculateBrain(height: int.parse(height), weight: int.parse(weight));
    else
      bmi =
          CalculateBrain(height: 180, weight: 70); //في حال عدم الادخال اول مرة
    bmi.calculateBMI();
  }
}
