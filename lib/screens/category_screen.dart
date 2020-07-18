import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:victor/widgets/main_drawer.dart';
import '../providers/category.dart';
import 'package:provider/provider.dart';
import '../widgets/categoryitem.dart';
import '../providers/session.dart';

class CategoryScreen extends StatelessWidget {
  void clear(context) {
    Provider.of<Session>(context, listen: false).clearExLog();
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categories =
        Provider.of<Categories>(context, listen: false).categories;

    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          actions: <Widget>[
            RaisedButton.icon(
                color: Colors.blue[300],
                onPressed: () => clear(context),
                icon: Icon(Icons.refresh),
                label: Text('Restart'))
          ],
        ),
        drawer: MainDrawer(),
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
