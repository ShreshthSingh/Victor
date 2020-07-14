import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/exercises.dart';
import '../widgets/exerciseitem.dart';

class ExercisesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];

    final filteredEx = Provider.of<Exercises>(context).filteredExercises(id);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView(
          padding: const EdgeInsets.all(15),
          children: filteredEx
              .map((exData) => ExerciseItem(exData.title, exData.id))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        ));
  }
}
