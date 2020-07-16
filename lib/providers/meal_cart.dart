import 'package:flutter/material.dart';
import './meal.dart';

class MealCartItem {
  final String id;
  final String name;
  final double quant;
  final double prot;
  final double carb;
  final double fat;
  final double calories;
  MealCartItem(
      {@required this.id,
      @required this.name,
      @required this.quant,
      @required this.prot,
      @required this.carb,
      @required this.fat,
      @required this.calories});
}

class CartMeals with ChangeNotifier {
  Map<String, MealCartItem> _cartMeals = {};

  Map<String, MealCartItem> get cartMeals {
    return _cartMeals;
  }

  void addMeal(Meal meal, double quant) {
    print('hii');

    var cartItem = MealCartItem(
        id: meal.id,
        name: meal.name,
        quant: quant,
        prot: meal.protein * quant,
        carb: meal.carbs * quant,
        fat: meal.fat * quant,
        calories: meal.calories * quant);
    _cartMeals[meal.id] = cartItem;
    notifyListeners();
    print(_cartMeals);
  }

  void removeMeal(String mealId) {
    _cartMeals.remove(mealId);
    notifyListeners();
  }

  int get mealsCount {
    notifyListeners();
    return _cartMeals.length;
  }

  Map<String, double> get macros {
    var protein = 0.0;
    var carbs = 0.0;
    var fat = 0.0;
    var calories = 0.0;
    _cartMeals.forEach((key, value) {
      protein += value.prot;
      carbs += value.carb;
      fat += value.fat;
      calories += value.calories;
    });

    // notifyListeners();
    return {
      'protein': double.parse((protein).toStringAsFixed(2)),
      'carbs': double.parse((carbs).toStringAsFixed(2)),
      'fat': double.parse((fat).toStringAsFixed(2)),
      'calories': double.parse((calories).toStringAsFixed(2))
    };
  }

  void clearMeals() {
    _cartMeals.clear();
    notifyListeners();
  }
}
