import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/meal_cart.dart';

class Analysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealData = Provider.of<CartMeals>(context).macros;

    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis'),
      ),
      body: Card(
          child: Column(
        children: <Widget>[
          Text('PROTEIN : ' + mealData['protein'].toString()),
          Text('FAT : ' + mealData['fat'].toString()),
          Text('CARBOS : ' + mealData['carbs'].toString()),
          Text('CALORIES : ' + mealData['calories'].toString()),
        ],
      )),
    );
  }
}
