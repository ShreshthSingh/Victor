import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../providers/exercises.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/session.dart';
import 'timer.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  var goingOn = false;
  var isRest = false;
  int seconds;
  void add(int sessionTime) {
    seconds = sessionTime;
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /* void start(context, id) {
    Provider.of<Session>(context).initSession(id);
  }

  void add(context) {
    Provider.of<Session>(context).addSession();
  }

  void rest(context) {
    Provider.of<Session>(context, listen: false).stop();
    setState(() {
      isRest = true;
    });
  }

  void unrest(context) {
    Provider.of<Session>(context, listen: false).start();
    setState(() {
      isRest = false;
    });
  }

  void stop(context) {
    Provider.of<Session>(context, listen: false).reset();
  }

  /* void start(context) {
    Provider.of<Session>(context, listen: false).start();
    setState(() {
      goingOn = true;
    });
  }

  void rest(context) {
    Provider.of<Session>(context, listen: false).stop();
    setState(() {
      isRest = true;
    });
  }

  void unrest(context) {
    Provider.of<Session>(context, listen: false).start();
    setState(() {
      isRest = false;
    });
  }

  void stop(context) {
    Provider.of<Session>(context, listen: false).stop();
    setState(() {
      goingOn = false;
    });
    //pushmap entry
  }

  void reset(context) {
    Provider.of<Session>(context, listen: false).reset();
    setState(() {
      goingOn = false;
    });
  } */
 */
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
              RaisedButton.icon(
                  color: Colors.red,
                  onPressed: () => _launchURL(exercise.upath),
                  icon: Icon(Icons.video_library),
                  label: Text('Youtube')),
              TimerPage(add)
            ],
          ),
        ),
      ),
    );
  }
}
