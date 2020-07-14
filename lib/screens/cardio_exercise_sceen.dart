import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../providers/exercises.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/session.dart';
import 'timer.dart';

class CardioExerciseScreen extends StatefulWidget {
  @override
  _CardioExerciseScreenState createState() => _CardioExerciseScreenState();
}

class _CardioExerciseScreenState extends State<CardioExerciseScreen> {
  var goingOn = false;
  var done = false;

  int seconds;

  void enactTime(
    int sessionTime,
  ) {
    setState(() {
      done = true;
    });
    if (seconds == null) {
      seconds = sessionTime;
    } else {
      seconds += sessionTime;
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void addCardio(context, id, scr) {
    Provider.of<Session>(context, listen: false).addCardio(id, seconds * scr);
    seconds = 0;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];

    final exercise =
        Provider.of<Exercises>(context, listen: false).findExercise(id);
    void goBack() {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }

    return WillPopScope(
      onWillPop: () => showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Are you sure you want to leave'),
            content: Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text('No'),
                ),
                SizedBox(
                  width: 5,
                ),
                RaisedButton(onPressed: goBack, child: Text('Yes'))
              ],
            ),
          )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton.icon(
                      color: Colors.red,
                      onPressed: () => _launchURL(exercise.upath),
                      icon: Icon(
                        Icons.video_library,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Youtube',
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    width: 9,
                  ),
                  RaisedButton.icon(
                    onPressed: done == true
                        ? () => addCardio(context, id, exercise.cardioScr)
                        : null,
                    icon: Icon(
                      Icons.check_box,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Finish',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue[900],
                  )
                ],
              ),
              TimerPage(enactTime),
            ],
          ),
        ),
      ),
    );
  }
}
