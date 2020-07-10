import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String sex;
  var name = TextEditingController();
  var mass = TextEditingController();
  var height = TextEditingController();
  var age = TextEditingController();

  void submitForm() {
    User user = User(
        age: int.parse(age.text),
        name: name.text,
        height: int.parse(height.text),
        mass: int.parse(mass.text),
        sex: sex == 'Male' ? 5 : -161);
    Provider.of<Users>(context, listen: false).add(user);

    Navigator.of(context).pushNamed('/result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add User')),
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
                    decoration: InputDecoration(labelText: 'Your Name'),
                    controller: name,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  TextField(
                      decoration: InputDecoration(labelText: 'Age in years'),
                      controller: age,
                      keyboardType: TextInputType.number),
                  TextField(
                      decoration: InputDecoration(labelText: 'Height in cm'),
                      controller: height,
                      keyboardType: TextInputType.number),
                  TextField(
                      decoration: InputDecoration(labelText: 'weight in kg'),
                      controller: mass,
                      keyboardType: TextInputType.number),

                  DropdownButton<String>(
                    value: sex,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        sex = newValue;
                      });
                    },
                    items: <String>['Male', 'Female']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )

                  //fieldsss
                ],
              ),
            )),
          ),
          RaisedButton.icon(
            onPressed: submitForm,
            icon: Icon(Icons.add),
            label: Text('Add Yourself'),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
