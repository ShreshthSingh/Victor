import 'package:flutter/material.dart';

class Session with ChangeNotifier {
  Map<String, double> cardLog = {};

  Map<String, double> mexLog = {};

  void addCardio(String id, double score) {
    cardLog[id] = double.parse((score).toStringAsFixed(2));
    print(cardLog);
  }

  void addEx(String id, double score) {
    mexLog[id] = double.parse((score).toStringAsFixed(2));
    print(mexLog);
  }

  double get cardioScore {
    var score = 0.0;
    cardLog.forEach((key, value) {
      score += value;
    });

    return double.parse((score).toStringAsFixed(2));
  }

  double get mexScore {
    var score = 0.0;
    mexLog.forEach((key, value) {
      score += value;
    });

    return double.parse((score).toStringAsFixed(2));
  }

  double get totalScore {
    var score = ((mexScore / 180) * 30) + ((cardioScore / 240) * 25);
    print(score);
    return score;
  }

  double get factor {
    if (totalScore <= 3) {
      return 1;
    } else if (3 < totalScore && totalScore <= 15) {
      return 1.05;
    } else if (15 < totalScore && totalScore <= 30) {
      return 1.2;
    } else if (30 < totalScore && totalScore <= 45) {
      return 1.3;
    } else if (45 < totalScore && totalScore <= 60) {
      return 1.47;
    } else if (60 < totalScore && totalScore <= 90) {
      return 1.77;
    } else if (90 < totalScore) {
      return 1.88;
    } else {
      return 2;
    }
  }

  void clearExLog() {
    cardLog.clear();
    mexLog.clear();
    notifyListeners();
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
