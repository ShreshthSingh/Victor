import 'package:flutter/material.dart';
import 'category.dart';

class Exercise {
  final String id;
  final String title;
  final String upath;
  final List<String> categories;
  final List<String> steps;
  final List<String> warnings;
  final int muscleScr;
  final int cardioScr;
  Exercise(
      {@required this.id,
      @required this.title,
      @required this.categories,
      @required this.steps,
      @required this.warnings,
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
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 70,
        cardioScr: 10,
        upath: 'https://www.youtube.com/results?search_query=pushups'),
    Exercise(
        id: 'e2',
        title: 'Diamond Pushups',
        upath: 'https://www.youtube.com/results?search_query=diamond+push+ups',
        categories: ['c1', 'c2', 'c3', 'c6'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 76,
        cardioScr: 15),
    Exercise(
        id: 'e3',
        title: 'Running',
        upath: 'https://www.youtube.com/results?search_query=running',
        categories: ['c7'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 10,
        cardioScr: 80),
    Exercise(
        id: 'e4',
        title: 'Sprint',
        upath: 'https://www.youtube.com/results?search_query=how+to+sprint',
        categories: ['c7'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 10,
        cardioScr: 95),
    Exercise(
        id: 'e5',
        title: 'Rope Skipping',
        upath: 'https://www.youtube.com/results?search_query=rope+skipping',
        categories: ['c7'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 13,
        cardioScr: 85),
    Exercise(
        id: 'e6',
        title: 'plank',
        upath: 'https://www.youtube.com/results?search_query=plank',
        categories: ['c6', 'c4'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 56,
        cardioScr: 29),
    Exercise(
        id: 'e7',
        title: 'Bunny Skips',
        upath:
            'https://www.youtube.com/results?search_query=bunny+hop+exercise',
        categories: ['c4', 'c7'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 20,
        cardioScr: 95),
    Exercise(
        id: 'e8',
        title: 'HeadStand pushups',
        upath:
            'https://www.youtube.com/results?search_query=headstand+push+ups',
        categories: ['c3', 'c1', 'c5'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 76,
        cardioScr: 18),
    Exercise(
        id: 'e9',
        title: 'Lunges',
        upath: 'https://www.youtube.com/results?search_query=lunges',
        categories: ['c4'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 70,
        cardioScr: 34),
    Exercise(
        id: 'e10',
        title: 'Squats',
        upath: 'https://www.youtube.com/results?search_query=squats',
        categories: ['c4'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 60,
        cardioScr: 15),
    Exercise(
        id: 'e11',
        title: 'Pullups',
        upath: 'https://www.youtube.com/results?search_query=pullups',
        categories: ['c1', 'c3', 'c5', 'c6'],
        steps: ['', '', '', '', ''],
        warnings: ['', '', '', '', ''],
        muscleScr: 77,
        cardioScr: 20)
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
