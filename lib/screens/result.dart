import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  var isInit = true;
  var isLoading = true;

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: isLoading == true
            ? Text('No user added')
            : Text(Provider.of<Users>(context, listen: false)
                .mantCalories
                .toString()),
      ),
    );
  }
}
