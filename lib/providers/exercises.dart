import 'package:flutter/material.dart';
import 'category.dart';

class Exercise {
  final String id;
  final String title;
  final String upath;
  final List<String> categories;
  final List<String> steps;
  final List<String> warnings;
  final bool isCardio;
  final double muscleScr;
  final double cardioScr;
  Exercise(
      {@required this.id,
      @required this.title,
      @required this.categories,
      @required this.steps,
      @required this.warnings,
      @required this.isCardio,
      @required this.muscleScr,
      @required this.cardioScr,
      this.upath});
}

class Exercises with ChangeNotifier {
  List<Exercise> _exercises = [
    Exercise(
        id: 'e1',
        title: 'Pushups',
        categories: ['c1', 'c2', 'c3', 'c6'],
        isCardio: false,
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.60,
        cardioScr: 0.10,
        upath: 'https://www.youtube.com/results?search_query=pushups'),
    Exercise(
        id: 'e2',
        isCardio: false,
        title: 'Diamond Pushups',
        upath: 'https://www.youtube.com/results?search_query=diamond+push+ups',
        categories: ['c1', 'c2', 'c3', 'c6'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.76,
        cardioScr: 0.15),
    Exercise(
        id: 'e3',
        isCardio: true,
        title: 'Running',
        upath: 'https://www.youtube.com/results?search_query=running',
        categories: ['c7'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.10,
        cardioScr: 0.70),
    Exercise(
        id: 'e4',
        isCardio: true,
        title: 'Sprint',
        upath: 'https://www.youtube.com/results?search_query=how+to+sprint',
        categories: ['c7'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.10,
        cardioScr: 0.99),
    Exercise(
        id: 'e5',
        isCardio: true,
        title: 'Rope Skipping',
        upath: 'https://www.youtube.com/results?search_query=rope+skipping',
        categories: ['c7'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.13,
        cardioScr: 0.75),
    Exercise(
        id: 'e6',
        isCardio: true,
        title: 'plank',
        upath: 'https://www.youtube.com/results?search_query=plank',
        categories: ['c6', 'c4'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.56,
        cardioScr: 0.50),
    Exercise(
        id: 'e7',
        isCardio: true,
        title: 'Bunny Skips',
        upath:
            'https://www.youtube.com/results?search_query=bunny+hop+exercise',
        categories: ['c4', 'c7'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.20,
        cardioScr: 0.80),
    Exercise(
        id: 'e8',
        title: 'HeadStand pushups',
        isCardio: false,
        upath:
            'https://www.youtube.com/results?search_query=headstand+push+ups',
        categories: ['c3', 'c1', 'c5'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.76,
        cardioScr: 0.18),
    Exercise(
        id: 'e9',
        isCardio: false,
        title: 'Lunges',
        upath: 'https://www.youtube.com/results?search_query=lunges',
        categories: ['c4'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.70,
        cardioScr: 0.34),
    Exercise(
        id: 'e10',
        isCardio: false,
        title: 'Squats',
        upath: 'https://www.youtube.com/results?search_query=squats',
        categories: ['c4'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.60,
        cardioScr: 0.15),
    Exercise(
        id: 'e11',
        isCardio: false,
        title: 'Pullups',
        upath: 'https://www.youtube.com/results?search_query=pullups',
        categories: ['c1', 'c3', 'c5', 'c6'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.77,
        cardioScr: 0.20),
    Exercise(
        id: 'e12',
        isCardio: true,
        title: 'Jumping Lunges',
        upath: 'https://www.youtube.com/results?search_query=pullups',
        categories: ['c4', 'c7'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.50,
        cardioScr: 0.70),
    Exercise(
        id: 'e13',
        isCardio: true,
        title: 'Jogging',
        upath: 'https://www.youtube.com/results?search_query=jogging',
        categories: ['c7'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 0.1,
        cardioScr: 0.50)
  ];

  List<Exercise> get exercises {
    return _exercises;
  }

  List<Exercise> filteredExercises(String id) {
    return _exercises
        .where((element) => element.categories.contains(id))
        .toList();
  }

  Exercise findExercise(String id) {
    return _exercises.firstWhere((element) => element.id == id);
  }
}
