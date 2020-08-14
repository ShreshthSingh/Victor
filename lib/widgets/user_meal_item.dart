import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:victor/providers/meal_cart.dart';
import '../providers/user_meals.dart';
import '../providers/meal_cart.dart';

class UserMealItem extends StatefulWidget {
  final String id;
  final String name;
  UserMealItem(this.id, this.name);
  @override
  _UserMealItemState createState() => _UserMealItemState();
}

class _UserMealItemState extends State<UserMealItem> {
  var quantity = 0;
  var done = false;
  var _quantity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final meal =
        Provider.of<UserMeals>(context, listen: false).getMeal(widget.id);
    final addedMeal =
        Provider.of<CartMeals>(context, listen: false).cartMeals[widget.id];

    if (addedMeal != null) {
      _quantity = TextEditingController(text: addedMeal.quant.toString());
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2, color: Colors.black),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue[50], Colors.white])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    widget.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Provider.of<UserMeals>(context, listen: false)
                          .deleteMeal(meal.id);
                    },
                  )
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'P : ' + meal.protein.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('F : ' + meal.fat.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(
                    width: 5,
                  ),
                  Text('C : ' + meal.carbs.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  Expanded(
                    child: Container(
                        width: 20,
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
                    color: done == false ? Colors.blue : Colors.red,
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
          ),
        ),
      ),
    );
  }
}
