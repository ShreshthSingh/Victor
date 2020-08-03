import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:victor/providers/meal_cart.dart';
import '../widgets/meal_item.dart';
import 'package:provider/provider.dart';
import '../providers/meal.dart';

class MealsScreen extends StatelessWidget {
  void goToAnalysis(BuildContext context) {
    Navigator.of(context).pushNamed('/mealanalysis');
  }

  void goToCustom(BuildContext context) {
    Navigator.of(context).pushNamed('/usermeals');
  }

  Widget build(BuildContext context) {
    final mealData = Provider.of<Meals>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Meals'),
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
                  // addAutomaticKeepAlives: true,
                  itemCount: mealData.meals.length,
                  itemBuilder: (context, i) =>
                      MealItem(mealData.meals[i].id, mealData.meals[i].name))),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton.icon(
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
                ),
              ),
              Expanded(
                child: RaisedButton.icon(
                  icon: Icon(
                    Icons.exposure,
                    color: Colors.white,
                  ),
                  color: Colors.blue,
                  label: Text(
                    'CUSTOM MEALS',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => goToCustom(context),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
