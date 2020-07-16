import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:victor/providers/meal_cart.dart';
import '../widgets/meal_item.dart';
import 'package:provider/provider.dart';
import '../providers/meal.dart';

class MealsScreen extends StatelessWidget {
  @override
  void goToAnalysis(BuildContext context) {
    Navigator.of(context).pushNamed('/mealanalysis');
  }

  Widget build(BuildContext context) {
    final mealData = Provider.of<Meals>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Todays Meals'),
        actions: <Widget>[
          RaisedButton.icon(
              color: Colors.red,
              onPressed: () {
                Provider.of<CartMeals>(context, listen: false).clearMeals();
                Navigator.of(context).pushReplacementNamed('/meals');
              },
              icon: Icon(
                Icons.autorenew,
                color: Colors.white,
              ),
              label: Text(
                'REFRESH',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: mealData.meals.length,
                  itemBuilder: (context, i) =>
                      MealItem(mealData.meals[i].id, mealData.meals[i].name))),
          RaisedButton.icon(
            icon: Icon(
              Icons.fastfood,
              color: Colors.white,
            ),
            color: Colors.red,
            label: Text(
              'Analysis',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => goToAnalysis(context),
          )
        ],
      ),
    );
  }
}
