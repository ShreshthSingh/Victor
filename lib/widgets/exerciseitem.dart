import 'package:flutter/material.dart';

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
    Navigator.of(ctx)
        .pushNamed('/exercise', arguments: {'id': id, 'title': title});
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
