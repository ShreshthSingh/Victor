import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user.dart';

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
                : Center(
                    child: RaisedButton.icon(
                        icon: Icon(Icons.directions_bike),
                        onPressed: catExer,
                        label: Text('Exercises')),
                  )));
  }
}
