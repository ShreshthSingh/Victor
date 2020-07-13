import 'package:flutter/material.dart';
import '../providers/category.dart';
import 'package:provider/provider.dart';
import '../widgets/categoryitem.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Category> categories =
        Provider.of<Categories>(context, listen: false).categories;

    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(15),
          children: categories
              .map((catData) => CategoryItem(catData.title, catData.id))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        ));
  }
}
