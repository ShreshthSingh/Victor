import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/exercises.dart';

class ExerciseItem extends StatelessWidget {
  final String title;
  final String id;

  ExerciseItem(this.title, this.id);

  void selectEx(BuildContext ctx) {
    /* Navigator.of(ctx).push(MaterialPageRoute(
      builder:(_){
      return CategoryExercises(title,id);
    })
    
    ) */
    Exercise exercise =
        Provider.of<Exercises>(ctx, listen: false).findExercise(id);
    if (exercise.isCardio) {
      Navigator.of(ctx)
          .pushNamed('/cardioexercise', arguments: {'id': id, 'title': title});
    } else {
      Navigator.of(ctx)
          .pushNamed('/mexercise', arguments: {'id': id, 'title': title});
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectEx(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'DancingScript',
            )), //Theme.of(context).textTheme.title) //for theme,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white.withOpacity(0.7),
            Colors.blue,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          //color: Colors.white,
          //border: Border.all(width:4,color: Colors.pink[50]) ,

          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }
}
