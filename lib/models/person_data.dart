import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thehealths/data/calculate_brain.dart';
import 'package:thehealths/data/data_breakfast.dart';
import 'package:thehealths/data/data_dinner.dart';
import 'package:thehealths/data/data_foods.dart';
import 'package:thehealths/data/data_sports.dart';
import 'package:thehealths/models/info_food.dart';
import 'package:thehealths/models/person.dart';
import 'package:thehealths/screens/home_page.dart';
import 'package:thehealths/screens/info_person.dart';

class PersonData extends ChangeNotifier {
  SharedPreferences sharedPreferences;
  List<String> favorite = [];
  int size;
  List<InfoFood> food = [];
  List<InfoFood> sport = [];
  Person _person;

  get person {
    //await getRef();
    return _person;
  }

  // Future getRef() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   _person = Person(sharedPreferences: sharedPreferences);
  // }

  PersonData(SharedPreferences sh) {
    print('sh');
    sharedPreferences = sh;
    _person = Person(sharedPreferences: sh);
    // favorite = sh.getStringList('list') ?? [];
    getF();
  }
  Future<void> getF() async {
    favorite =  sharedPreferences.getStringList('list') ?? [];
    loadDataSports();
    print('sh2');
  }

  loadDataSports() {
    sport.clear();
    food.clear();
    for (String v in favorite) {
      for (int j = 0; j < sports.length; j++) {
        if (v == sports[j]) {
          sport.add(
            InfoFood(
              name: sports[j],
              type: 'sports',
              index: j,
              preparation: notes[j],
              ingredients: benefits[j],
            ),
          );
        }
      }
      for (int j = 0; j < foods.length; j++) {
        if (v == foods[j]) {
          food.add(
            InfoFood(
              name: foods[j],
              type: 'foods',
              index: j,
              ingredients: ingredientsFoods[j],
              preparation: preparationFoods[j],
            ),
          );
        }
      }
      for (int j = 0; j < dinner.length; j++) {
        if (v == dinner[j]) {
          food.add(
            InfoFood(
              name: dinner[j],
              type: 'dinner',
              index: j,
              ingredients: ingredientsDinner[j],
              preparation: preparationDinner[j],
            ),
          );
        }
      }
      for (int j = 0; j < breakFast.length; j++) {
        if (v == breakFast[j]) {
          food.add(
            InfoFood(
              name: breakFast[j],
              type: 'breakfast',
              index: j,
              preparation: preparationBreakfast[j],
              ingredients: ingredientsBreakfast[j],
            ),
          );
        }
      }
    }
  }

  bool getFavorite(String name) {
    for (int i = 0; i < favorite.length; i++) {
      if (name == favorite[i]) {
        return true;
      }
    }
    return false;
  }

  upDataFavorite() {
    for (var s in favorite) {
      print(s);
    }
    loadDataSports();
    notifyListeners();
  }

  upDataPerson({String name, String age, String weight, String height}) {
    _person.name = name;
    _person.age = age;
    _person.weight = weight;
    _person.height = height;
    _person.bmi =
        CalculateBrain(height: int.parse(height), weight: int.parse(weight));
    _person.bmi.calculateBMI();
    notifyListeners();
  }
}
