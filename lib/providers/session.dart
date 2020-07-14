import 'package:flutter/material.dart';

class Session with ChangeNotifier {
  List<Map<String, double>> cardLog = [];

  List<Map<String, double>> mexLog = [];

  void addCardio(String id, double score) {
    cardLog.insert(0, {id: double.parse((score).toStringAsFixed(2))});
    print(cardLog);
  }

  void addEx(String id, double score) {
    mexLog.insert(0, {id: score});
    print(mexLog);
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
