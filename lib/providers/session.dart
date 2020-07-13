import 'package:flutter/material.dart';

class Session with ChangeNotifier {
  List<String> sessLog = [];

  void add(String sec) {
    sessLog.insert(0, sec);
    notifyListeners();
    print(sessLog);
  }

/* 
  Stopwatch session = Stopwatch();
  Map<String, dynamic> presentSession = {'id': '', 'time': 0.0};

  void initSession(String id) {
    presentSession = {'id': id, 'time': elapsedSec};
  }

  Map<String, double> get pres {
    return presentSession;
  }

  void addSession() {
    sessLog.insert(0, presentSession);
    notifyListeners();
  }

  void start() {
    session.start();
    notifyListeners();
  }

  void stop() {
    session.stop();
    notifyListeners();
    print(sessLog);
  }

  void reset() {
    addSession();
    presentSession = {'id': 0.0};

    session.reset();
    notifyListeners();
  }

  double get elapsedSec {
    notifyListeners();
    return (session.elapsedTicks / session.frequency);
  } */
}
