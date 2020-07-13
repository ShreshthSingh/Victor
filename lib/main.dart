import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:victor/providers/category.dart';
import 'package:victor/providers/exercises.dart';
import 'package:victor/providers/session.dart';
import 'package:victor/screens/category_screen.dart';
import 'package:victor/screens/exercise_sceen.dart';
import 'package:victor/screens/exercises_screen.dart';
import 'package:victor/screens/sign_up.dart';
import 'package:victor/screens/splash_screen.dart';
import 'package:victor/screens/timer.dart';
import './providers/user.dart';
import './screens/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Users()),
          ChangeNotifierProvider.value(value: Categories()),
          ChangeNotifierProvider.value(value: Exercises()),
          ChangeNotifierProvider.value(value: Session())
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
          title: 'Victor',
          home: SplashScreen(),
          routes: {
            '/adduser': (ctx) => SignUp(),
            '/result': (ctx) => Result(),
            '/categories': (ctx) => CategoryScreen(),
            '/exercises': (ctx) => ExercisesScreen(),
            '/exercise': (ctx) => ExerciseScreen()
          },
        ));
  }
}
