import 'dart:async';

import 'package:newblocexg/Services.dart';
import 'package:newblocexg/model/Users.dart';

abstract class Bloc {
  void dispose();
}

enum UserAction { Fetch, searchList }

class UserBloc extends Bloc {
  final eventUserStreamController = StreamController<UserAction>.broadcast();
  StreamSink<UserAction> get eventSink => eventUserStreamController.sink;
  Stream<UserAction> get eventStream => eventUserStreamController.stream;

  final stateStreamController = StreamController<List<User>>.broadcast();
  StreamSink<List<User>> get userStateSink => stateStreamController.sink;
  Stream<List<User>> get userStateStream => stateStreamController.stream;

  UserBloc() {
    eventStream.listen((event) async {
      if (event == UserAction.Fetch) {
        try {
          Services.getUsers().then((users) {
            print('getUsers : ${users.toString()}');
            if (users != null) {
              userStateSink.add(users);
            } else {
              userStateSink.addError("Someting went wrong !!!");
            }
          });
        } catch (e) {
          throw Exception("Something went Wrong Exception");
        }
      }
    });
  }

  @override
  void dispose() {
    eventUserStreamController.close();
    stateStreamController.close();
  }
}
