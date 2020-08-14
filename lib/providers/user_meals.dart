import 'package:flutter/material.dart';
import './meal.dart';
//import 'package:path_provider/path_provider.dart' as syspath;
//import 'package:path/path.dart' as path;
import '../DBhelper/dbhelper.dart';

class UserMeals with ChangeNotifier {
  List<Meal> _userMeals = [];
  List<Meal> get userMeals {
    return _userMeals;
  }

  void addMeal(Meal meal) {
    _userMeals.insert(0, meal);
    notifyListeners();
    DBhelper.insert('user_meals', {
      'id': meal.id,
      'name': meal.name,
      'protein': meal.protein.toString(),
      'fat': meal.fat.toString(),
      'carbs': meal.carbs.toString(),
      'calories': meal.calories.toString()
    });
  }

  Future<void> fetchAndSet() async {
    final dataList = await DBhelper.getData('user_meals');
    _userMeals = dataList
        .map((item) => Meal(
              id: item['id'],
              name: item['name'],
              protein: double.parse(item['protein']),
              fat: double.parse(item['fat']),
              carbs: double.parse(item['carbs']),
              calories: double.parse(item['calories']),
            ))
        .toList();
    notifyListeners();
  }

  Meal getMeal(id) {
    return _userMeals.firstWhere((element) => element.id == id);
  }

  Future<void> deleteMeal(String id) async {
    await DBhelper.deleteRecord(id, 'user_meals');
    fetchAndSet();
  }
}
