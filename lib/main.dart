import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:victor/screens/sign_up.dart';
import './providers/user.dart';
import './screens/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Users()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
          title: 'Victor',
          home: SignUp(),
          routes: {'/adduser': (ctx) => SignUp(), '/result': (ctx) => Result()},
        ));
  }
}
