import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_meals.dart';
import '../providers/meal.dart';

class AddMealScreen extends StatefulWidget {
  @override
  _AddMealScreenState createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  var name = TextEditingController();
  var protein = TextEditingController();
  var fat = TextEditingController();
  var carbs = TextEditingController();
  var calories = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    name.dispose();
    protein.dispose();
    fat.dispose();
    carbs.dispose();
    calories.dispose();
    super.dispose();
  }

  void submitForm() {
    Meal meal = Meal(
        id: DateTime.now().toString(),
        name: name.text,
        protein: double.parse(protein.text),
        fat: double.parse(fat.text),
        carbs: double.parse(carbs.text),
        calories: double.parse(calories.text));
    Provider.of<UserMeals>(context, listen: false).addMeal(meal);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Meal')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Meal Name'),
                    controller: name,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  TextField(
                      decoration: InputDecoration(labelText: 'Protein in gm'),
                      controller: protein,
                      keyboardType: TextInputType.number),
                  TextField(
                      decoration: InputDecoration(labelText: 'Fat in gm'),
                      controller: fat,
                      keyboardType: TextInputType.number),
                  TextField(
                      decoration:
                          InputDecoration(labelText: 'Carbohydrates in gm'),
                      controller: carbs,
                      keyboardType: TextInputType.number),
                  TextField(
                      decoration: InputDecoration(labelText: 'Calories in cal'),
                      controller: calories,
                      keyboardType: TextInputType.number)

                  //fieldsss
                ],
              ),
            )),
          ),
          RaisedButton.icon(
            onPressed: submitForm,
            icon: Icon(Icons.add),
            label: Text('Add Meal'),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
