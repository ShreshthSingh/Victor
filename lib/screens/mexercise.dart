import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/exercises.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/session.dart';

class MExerciseScreen extends StatefulWidget {
  @override
  _MExerciseScreenState createState() => _MExerciseScreenState();
}

class _MExerciseScreenState extends State<MExerciseScreen> {
  var reps = TextEditingController();
  var sets = TextEditingController();

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void addSession(ctx, id, score) {
    if ((reps.text == null) || (sets.text == null)) {
      return;
    }
    Provider.of<Session>(ctx, listen: false).addEx(id, score);
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];

    final exercise =
        Provider.of<Exercises>(context, listen: false).findExercise(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton.icon(
              color: Colors.red,
              onPressed: () => _launchURL(exercise.upath),
              icon: Icon(Icons.video_library),
              label: Text('Youtube')),
          TextField(
              decoration: InputDecoration(labelText: 'Reps'),
              controller: reps,
              keyboardType: TextInputType.number),
          TextField(
              decoration: InputDecoration(labelText: 'Sets'),
              controller: sets,
              keyboardType: TextInputType.number),
          RaisedButton(
            onPressed: () => addSession(
                context,
                id,
                exercise.muscleScr *
                    int.parse(sets.text) *
                    int.parse(reps.text)),
            color: Colors.red,
            child: Text(
              'Done',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
