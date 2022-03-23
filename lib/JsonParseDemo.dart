import 'package:flutter/material.dart';
import 'package:newblocexg/Services.dart';
import 'package:newblocexg/connection_helper.dart';
import 'package:newblocexg/model/Users.dart';

class JsonPareDemo extends StatefulWidget {
  const JsonPareDemo() : super();

  @override
  _JsonPareDemoState createState() => _JsonPareDemoState();
}

class _JsonPareDemoState extends State<JsonPareDemo> {
  late List<User> _users;
  late bool _loading;

  Future<void> getUser() async {
    _loading = true;
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      Services.getUsers().then((users) {
        setState(() {
          _users = users;
          _loading = false;
        });
      });
    } else {
      print('device offline');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Users'),
      ),
      body: Container(
        /*width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.isFinite,*/
        color: Colors.white,
        child: getList(),
        /*ListView.builder(itemBuilder: (context, index) {
          User user = _users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.address.city),
          );
        }),*/
      ),
    );
  }

  Widget getList() {
    ListView myList = new ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          User user = _users[index];
          return new ListTile(
            title: new Text(user.name),
            subtitle: Text(user.address.city),
          );
        });
    return myList;
  }
}
