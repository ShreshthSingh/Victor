import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/meal_cart.dart';
import 'package:pie_chart/pie_chart.dart';
import '../providers/session.dart';

class Analysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealData = Provider.of<CartMeals>(context).macros;

    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis'),
      ),
      body: Card(
          child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Text(
              'PROTEIN : ' + mealData['protein'].toString() + 'gm',
            ),
            Text('FAT : ' + mealData['fat'].toString() + 'gm'),
            Text('CARBOS : ' + mealData['carbs'].toString() + 'gm'),
            Text('CALORIES : ' + mealData['calories'].toString()),
            PieChart(dataMap: {
              'Protein': mealData['protein'],
              'Fat': mealData['fat'],
              'Carbs': mealData['carbs']
            }),
          ],
        ),
      )),
    );
  }
}
