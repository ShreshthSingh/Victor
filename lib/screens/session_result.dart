import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/session.dart';
import 'package:pie_chart/pie_chart.dart';

class SessionResult extends StatelessWidget {
  //((mexScore / 180) * 30) + ((cardioScore / 240) * 25)
  @override
  Widget build(BuildContext context) {
    final mexScore = Provider.of<Session>(context, listen: false).mexScore;
    final cardioScore =
        Provider.of<Session>(context, listen: false).cardioScore;
    final totalScore = Provider.of<Session>(context, listen: false).totalScore;
    return Scaffold(
        appBar: AppBar(
          title: Text('Result'),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Text('Muscle Score :' + mexScore.toString()),
                      Text('Cardio Score :' + cardioScore.toString()),
                      PieChart(dataMap: {
                        'Muscle': (mexScore / 180) * 30,
                        'Cardio': (cardioScore / 240) * 25,
                      }),
                      Text('Effective Minutes :' + totalScore.toString())
                    ],
                  )),
            )
          ],
        ));
  }
}
