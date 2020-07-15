import 'package:flutter/material.dart';

class Meal {
  final String id;
  final String name;
  //final double baseQuant;
  // final int quantity;
  final double protein;
  final double fat;
  final double carbs;
  final double calories;
  final String imagepath;

  Meal(
      {this.id,
      this.name,
      //    this.baseQuant,
      //   this.quantity,
      this.protein,
      this.fat,
      this.carbs,
      this.calories,
      this.imagepath});
}

class Meals with ChangeNotifier {
  List<Meal> _meals = [
    Meal(
        id: 'm1',
        name: 'Roti',
        protein: 3.1,
        fat: 3.7,
        carbs: 18,
        calories: 120,
        imagepath: ''),
    Meal(
        id: 'm2',
        name: 'Rice (100gm)',
        protein: 3.7,
        fat: 0.9,
        carbs: 23,
        calories: 111,
        imagepath: ''),
    Meal(
        id: 'm3',
        name: 'ChickPea(boiled 100gm)',
        protein: 8,
        fat: 2.6,
        carbs: 27,
        calories: 164,
        imagepath: ''),
    Meal(
        id: 'm4',
        name: 'Roasted Gram(100gm)',
        protein: 22,
        fat: 6,
        carbs: 60,
        calories: 380,
        imagepath: ''),
    Meal(
        id: 'm5',
        name: 'Rajma (Boiled 100gm)',
        protein: 9,
        fat: 0.5,
        carbs: 23,
        calories: 127,
        imagepath: ''),
    Meal(
        id: 'm6',
        name: 'Mung Dal(Boiled 100gm)',
        protein: 7,
        fat: 0.4,
        carbs: 19,
        calories: 105,
        imagepath: ''),
    Meal(
        id: 'm7',
        name: 'Mung Dal(Sprouted 100gm)',
        protein: 3,
        fat: 0.2,
        carbs: 6,
        calories: 30,
        imagepath: ''),
    Meal(
        id: 'm8',
        name: 'Arhar Dal(boiled 100gm)',
        protein: 7,
        fat: 0.4,
        carbs: 23,
        calories: 121,
        imagepath: ''),
    Meal(
        id: 'm9',
        name: 'Chana(Boiled 100gm)',
        protein: 7,
        fat: 2.4,
        carbs: 25,
        calories: 150,
        imagepath: ''),
    Meal(
        id: 'm10',
        name: 'Oats(Cooked 100gm)',
        protein: 6,
        fat: 3.7,
        carbs: 28,
        calories: 166,
        imagepath: ''),
    Meal(
        id: 'm11',
        name: 'Paneer (100gm)',
        protein: 13,
        fat: 4,
        carbs: 3.4,
        calories: 98,
        imagepath: ''),
    Meal(
        id: 'm12',
        name: 'Egg(boiled)',
        protein: 6,
        fat: 5,
        carbs: 0.6,
        calories: 78,
        imagepath: ''),
    Meal(
        id: 'm14',
        name: 'Dahi(100 gm)',
        protein: 11,
        fat: 5,
        carbs: 3.4,
        calories: 98,
        imagepath: ''),
  ];

  List<Meal> get meals {
    return _meals;
  }

  Meal getMeal(id) {
    return _meals.firstWhere((element) => element.id == id);
  }
}
