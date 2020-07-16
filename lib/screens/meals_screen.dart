import 'package:flutter/material.dart';
import 'package:path/path.dart';
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
            label: Text('Analysis'),
            onPressed: () => goToAnalysis(context),
          )
        ],
      ),
    );
  }
}
