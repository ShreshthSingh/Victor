import 'package:flutter/material.dart';
import 'package:victor/DBhelper/dbhelper.dart';

class User {
  String name;
  int age;
  int height;
  int sex;
  int mass;

  User({this.name, this.age, this.height, this.mass, this.sex});
}

class Users with ChangeNotifier {
  List<User> _users = [];

  List<User> get users {
    return [..._users];
  }

  void add(User user) {
    if (_users.length > 1) {
      return;
    }
    _users.insert(0, user);
    DBhelper.insert('user', {
      'name': user.name,
      'age': user.age,
      'mass': user.mass,
      'height': user.height,
      'sex': user.sex
    });
    notifyListeners();
  }

  Future<void> fetchAndSet() async {
    final dataList = await DBhelper.getData('user');
    _users = dataList
        .map((item) => User(
            age: item['age'],
            height: item['height'],
            mass: item['mass'],
            name: item['name'],
            sex: item['sex']))
        .toList();
    notifyListeners();
  }

  double get mantCalories {
    User currUser = _users[0];

    double cal = ((10 * currUser.mass) -
        (5 * currUser.age) +
        (6.25 * currUser.height) +
        currUser.sex);
    return cal;
  }
}
