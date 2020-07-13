import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Image image;

  const Category({@required this.id, @required this.title, this.image});
}

class Categories with ChangeNotifier {
  List<Category> _categories = const [
    Category(
      id: 'c1',
      title: 'Hands',
    ),
    Category(
      id: 'c2',
      title: 'Chest',
    ),
    Category(id: 'c3', title: 'Shoulder'),
    Category(
      id: 'c4',
      title: 'Legs ',
    ),
    Category(
      id: 'c5',
      title: 'Back',
    ),
    Category(
      id: 'c6',
      title: 'Abs',
    ),
    Category(
      id: 'c7',
      title: 'Cardio',
    )
  ];

  List<Category> get categories {
    return _categories;
  }
}
