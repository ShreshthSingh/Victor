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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
                child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Text(
                    'PROTEIN : ' + mealData['protein'].toString() + 'gm',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('FAT : ' + mealData['fat'].toString() + 'gm',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('CARBOS : ' + mealData['carbs'].toString() + 'gm',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('CALORIES : ' + mealData['calories'].toString() + 'cal',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  PieChart(dataMap: {
                    'Protein': mealData['protein'],
                    'Fat': mealData['fat'],
                    'Carbs': mealData['carbs']
                  }),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
