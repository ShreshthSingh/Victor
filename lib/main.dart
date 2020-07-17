import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:victor/providers/category.dart';
import 'package:victor/providers/exercises.dart';
import 'package:victor/providers/meal.dart';
import 'package:victor/providers/session.dart';
import 'package:victor/screens/category_screen.dart';
import 'package:victor/screens/cardio_exercise_sceen.dart';
import 'package:victor/screens/choose_user.dart';
import 'package:victor/screens/exercises_screen.dart';
import 'package:victor/screens/meal_analysis.dart';
import 'package:victor/screens/meals_screen.dart';
import 'package:victor/screens/mexercise.dart';
import 'package:victor/screens/session_result.dart';
import 'package:victor/screens/sign_up.dart';
import 'package:victor/screens/splash_screen.dart';
import 'package:victor/screens/timer.dart';
import './providers/user.dart';
import './screens/result.dart';
import './providers/meal_cart.dart';

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
          ChangeNotifierProvider.value(value: Session()),
          ChangeNotifierProvider.value(value: Meals()),
          ChangeNotifierProvider.value(value: CartMeals())
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
            '/cardioexercise': (ctx) => CardioExerciseScreen(),
            '/mexercise': (ctx) => MExerciseScreen(),
            '/meals': (ctx) => MealsScreen(),
            '/mealanalysis': (ctx) => Analysis(),
            '/sessionresult': (ctx) => SessionResult(),
            '/chooseuser': (ctx) => ChooseUser()
          },
        ));
  }
}
