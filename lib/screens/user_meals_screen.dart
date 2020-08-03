import 'package:flutter/material.dart';
import 'package:victor/providers/meal_cart.dart';
import '../widgets/user_meal_item.dart';
import 'package:provider/provider.dart';
import '../providers/user_meals.dart';

class UserMealsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Custom Meals'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed('/addmeal');
                })
          ],
        ),
        body: FutureBuilder(
            future:
                Provider.of<UserMeals>(context, listen: false).fetchAndSet(),
            builder: (ctx, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Consumer<UserMeals>(
                        builder: (ctx, userMeals, ch) =>
                            userMeals.userMeals.length == 0
                                ? ch
                                : ListView.builder(
                                    itemCount: userMeals.userMeals.length,
                                    itemBuilder: (ctx, i) => UserMealItem(
                                        userMeals.userMeals[i].id,
                                        userMeals.userMeals[i].name)),
                        child: Center(child: Text('No Custom Meals Added')),
                      )));
  }
}
