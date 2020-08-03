import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Victor',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text(
              'Exercises',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () {
              // Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed('/categories');
            },
          ),
          ListTile(
            title: Text(
              'Meal Planner',
              style: TextStyle(
                  color: Colors.black,
                  //fontFamily: 'AbrilFatface',
                  fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/meals');
              // Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text(
              'Session Analysis',
              style: TextStyle(
                  color: Colors.black,
                  //fontFamily: 'AbrilFatface',
                  fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/chooseuser');
              // Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text(
              'Add/Edit User',
              style: TextStyle(
                  color: Colors.black,
                  //fontFamily: 'AbrilFatface',
                  fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/adduser');
            },
          ),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(
                  color: Colors.black,
                  //fontFamily: 'AbrilFatface',
                  fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
      ),
    );
  }
}
