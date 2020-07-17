import 'package:flutter/material.dart';
//import 'package:victor/DBhelper/dbhelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

class User {
  String id;
  String name;
  int age;
  int height;
  int sex;
  int mass;

  User({this.id, this.name, this.age, this.height, this.mass, this.sex});
}

class Users with ChangeNotifier {
  String currentUserId;
  void setUser(String userId) {
    currentUserId = userId;
    notifyListeners();
  }

  User _user;

  User get user {
    return _user;
  }

  Future<void> add(User user) async {
    /* if (_users.length > 1) {
      return;
    }
    // _users.insert(0, user); */

    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'id': user.id,
      'name': user.name,
      'age': user.age,
      'mass': user.mass,
      'height': user.height,
      'sex': user.sex
    });
    prefs.setString('userData', userData);
    /*  DBhelper.insert('user', {
      'id': user.id,
      'name': user.name,
      'age': user.age,
      'mass': user.mass,
      'height': user.height,
      'sex': user.sex
    }); */
    notifyListeners();
    //fetchAndSet();
  }

  Future<void> fetchAndSet() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;

    User currUser = User(
        age: extractedUserData['age'],
        height: extractedUserData['height'],
        id: extractedUserData['id'],
        mass: extractedUserData['mass'],
        name: extractedUserData['name'],
        sex: extractedUserData['sex']);
    _user = currUser;
    notifyListeners();

    return true;

    /*  final dataList = await DBhelper.getData('user');
    _users = dataList
        .map((item) => User(
            id: item['id'],
            age: item['age'],
            height: item['height'],
            mass: item['mass'],
            name: item['name'],
            sex: item['sex']))
        .toList(); */
  }

  double get mantCalories {
    User currUser = _user;

    double cal = ((10 * currUser.mass) -
        (5 * currUser.age) +
        (6.25 * currUser.height) +
        currUser.sex);
    return cal;
  }
}
