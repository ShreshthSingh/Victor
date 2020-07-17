import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:victor/providers/session.dart';
import '../providers/user.dart';

class ChooseUser extends StatefulWidget {
  @override
  _ChooseUserState createState() => _ChooseUserState();
}

class _ChooseUserState extends State<ChooseUser> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Users>(context, listen: false).fetchAndSet().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  void setCurrentUser(String userId) {
    Provider.of<Users>(context, listen: false).setUser(userId);
    Navigator.of(context).pushNamed('/sessionresult');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose User'),
      ),
      body: _isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Consumer<Users>(
                  builder: (context, usersData, child) {
                    return usersData.user == null
                        ? child
                        : InkWell(
                            onTap: () => setCurrentUser(usersData.user.id),
                            child: Card(
                              child: ListTile(
                                title: Text(usersData.user.name),
                                /* leading: CircleAvatar(
                                          child: Image.asset(
                                              'assets/images/avatar.png'), 
                                        )*/
                              ),
                            ),
                          );
                  },
                  child: Text('No users Added')),
            ),
    );
  }
}
