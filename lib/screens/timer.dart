import 'package:flutter/material.dart';
import 'package:flutter_timer/flutter_timer.dart';
import 'package:provider/provider.dart';
import '../providers/session.dart';

class TimerPage extends StatefulWidget {
  final Function sessionAdded;

  TimerPage(this.sessionAdded);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  bool running = false;

  int sessionTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
              ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              TikTikTimer(
                initialDate: DateTime.now(),
                running: running,
                height: 100,
                width: 100,
                backgroundColor: Colors.blue[100],
                timerTextStyle: TextStyle(color: Colors.black, fontSize: 20),
                borderRadius: 100,
                isRaised: true,
                tracetime: (time) {
                  sessionTime = (time.currentSeconds) +
                      (time.currentMinutes * 60) +
                      (time.currentHour * 3600);
                },
              ),
              Expanded(
                child: RaisedButton(
                  child: Text(
                    'Start',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    try {
                      if (running == false)
                        setState(() {
                          running = true;
                        });
                    } on Exception {}
                  },
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text(
                    'Stop',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    if (running == true)
                      setState(() {
                        running = false;
                      });
                    widget.sessionAdded(sessionTime);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
