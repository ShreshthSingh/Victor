import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/meal_cart.dart';
import 'package:pie_chart/pie_chart.dart';
import '../providers/session.dart';
import '../providers/user.dart';

class Analysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealData = Provider.of<CartMeals>(context).macros;
    final mantCal = Provider.of<Users>(context, listen: false).mantCalories;
    final factor = Provider.of<Session>(context, listen: false).factor;

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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text('FAT : ' + mealData['fat'].toString() + 'gm',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text('CARBOS : ' + mealData['carbs'].toString() + 'gm',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text('CALORIES : ' + mealData['calories'].toString() + 'cal',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  PieChart(dataMap: {
                    'Protein': mealData['protein'],
                    'Fat': mealData['fat'],
                    'Carbs': mealData['carbs']
                  }),
                  Text(
                    'For a daily workout like today you need :' +
                        ((mantCal * factor)).toStringAsFixed(2) +
                        " calories." +
                        "This meal counts to " +
                        mealData['calories'].toString() +
                        ' calories',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text(
                    mealData['calories'] > (mantCal * factor) == true
                        ? "CALORIFIC SURPLUS"
                        : (mealData['calories'] < (mantCal * factor) == true
                            ? "CALORIFIC DEFICIT"
                            : "BALANCED"),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Text('CALORIFIC SURPLUS : WEIGHT/MUSCLE GAIN',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('CALORIFIC DEFICIT : WEIGHT/MUSCLE LOSS',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('BALANCED : WEIGHT MAINTENANCE',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
