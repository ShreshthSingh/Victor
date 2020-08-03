import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../providers/session.dart';
import 'package:pie_chart/pie_chart.dart';
import '../providers/user.dart';
import '../providers/session.dart';

class SessionResult extends StatelessWidget {
  //((mexScore / 180) * 30) + ((cardioScore / 240) * 25)
  @override
  Widget build(BuildContext context) {
    final mexScore = Provider.of<Session>(context, listen: false).mexScore;
    final cardioScore =
        Provider.of<Session>(context, listen: false).cardioScore;
    final totalScore = Provider.of<Session>(context, listen: false).totalScore;
    final mantCal = Provider.of<Users>(context, listen: false).mantCalories;
    final factor = Provider.of<Session>(context, listen: false).factor;
    return Scaffold(
        appBar: AppBar(
          title: Text('Result'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Text('Muscle Score :' + mexScore.toString(),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Text('Cardio Score :' + cardioScore.toString(),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        PieChart(dataMap: {
                          'Muscle': (mexScore / 180) * 30,
                          'Cardio': (cardioScore / 240) * 25,
                        }),
                        Text(
                            'Effective Minutes :' +
                                (totalScore).toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Text(
                            'Your base mantainence calories are :' +
                                (mantCal).toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Text(
                          'For a daily workout like today you need :' +
                              ((mantCal * factor)).toStringAsFixed(2),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
