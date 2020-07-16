import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:victor/widgets/main_drawer.dart';
import '../providers/user.dart';
import '../providers/session.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var isInit = true;
  var isLoading = true;

  void addUser() {
    Navigator.of(context).pushNamed('/adduser');
  }

  void catExer() {
    Navigator.of(context).pushNamed('/categories');
  }

  void goToMeals() {
    Navigator.of(context).pushNamed('/meals');
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Users>(context, listen: false).fetchAndSet().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<User> users = Provider.of<Users>(context).users;
    return Scaffold(
        appBar: AppBar(
          title: Text('Victor beta'),
        ),
        drawer: MainDrawer(),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (users.length == 0
                ? Center(
                    child: RaisedButton.icon(
                        onPressed: addUser,
                        icon: Icon(Icons.add),
                        label: Text('Add User')),
                  )
                : Column(
                    children: <Widget>[
                      Center(
                        child: RaisedButton.icon(
                            icon: Icon(Icons.directions_bike),
                            onPressed: catExer,
                            label: Text('Exercises')),
                      ),
                      RaisedButton.icon(
                          onPressed: () {
                            Provider.of<Session>(context, listen: false)
                                .totalScore;
                          },
                          icon: Icon(Icons.assignment),
                          label: Text('Analysis')),
                      RaisedButton.icon(
                          onPressed: goToMeals,
                          icon: Icon(Icons.assignment),
                          label: Text('Meals Screen'))
                    ],
                  )));
  }
}
