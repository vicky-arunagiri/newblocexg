import 'package:flutter/material.dart';
import 'package:newblocexg/Services.dart';
import 'package:newblocexg/bloc/user_bloc.dart';
import 'package:newblocexg/connection_helper.dart';
import 'package:newblocexg/model/Users.dart';

class UserPage extends StatefulWidget {
  const UserPage() : super();

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late List<User> _users;
  late bool _loading;
  final userBloc = UserBloc();

  /*Future<void> getUser() async {
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getUser();
    setState(() {
      userBloc.eventSink.add(UserAction.Fetch);
    });
  }

  @override
  void dispose() {
    userBloc.dispose();
    print('close stream');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: StreamBuilder<List<User>>(
          stream: userBloc.userStateStream,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Text("${snapshot.error}"),
              );

            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return getList(context, snapshot);
          }),
    );
  }

  Widget getList(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    print('snapshpts : ${snapshot.data}');
    final _users = snapshot.data;
    ListView myList = new ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          User user = _users[index];
          return new ListTile(
            title: new Text(user.name),
            subtitle: Text(user.company.name),
          );
        });
    return myList;
  }
}
