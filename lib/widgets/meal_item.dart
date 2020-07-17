import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:victor/providers/meal_cart.dart';
import '../providers/meal.dart';
import '../providers/meal_cart.dart';

class MealItem extends StatefulWidget {
  final String id;
  final String name;
  MealItem(this.id, this.name);
  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  var quantity = 0;
  var done = false;
  var _quantity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meals>(context, listen: false).getMeal(widget.id);
    return Card(
        shadowColor: Colors.amber,
        elevation: 6,
        color: Colors.green[50],
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  widget.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                )
              ],
            ),
            SizedBox(
              height: 23,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Pro: ' + meal.protein.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Fat : ' + meal.fat.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                SizedBox(
                  width: 8,
                ),
                Text('Carbs :' + meal.carbs.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                SizedBox(
                  width: 10,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      height: 50,
                      width: 50,
                      child: TextFormField(
                          controller: _quantity,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                              labelText: 'X',
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.blue))))),
                ),
                RaisedButton.icon(
                  color: done == false ? Colors.green[300] : Colors.red,
                  icon: Icon(Icons.add),
                  label: Text('Add'),
                  onPressed: () {
                    Provider.of<CartMeals>(context, listen: false)
                        .addMeal(meal, double.parse(_quantity.text));

                    setState(() {
                      done = true;
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: 11,
            ),

            /* Container(
              width: 67,
              child: Row(
                children: <Widget>[
                  Text(
                    'X',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextField(
                      decoration: InputDecoration(labelText: 'Times'),
                      controller: _quantity,
                      keyboardType: TextInputType.number),
                  RaisedButton.icon(
                    icon: Icon(Icons.add),
                    label: Text('Add'),
                    onPressed: () {
                      Provider.of<CartMeals>(context, listen: false)
                          .addMeal(meal, int.parse(_quantity.text));
                    },
                  ),
                ],
              ),
            ) */
          ],
        ));
  }
}
