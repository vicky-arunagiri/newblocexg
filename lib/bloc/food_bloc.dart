import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:newblocexg/model/foodmodel.dart';

enum FoodAction { Fetch, searchList, edit, delete }

class FoodBloc {
  static const String url =
      'https://forkify-api.herokuapp.com/api/search?q=pizza#';
  //Single Subscription and Broadcast Stream
  final _eventStreamController = StreamController<FoodAction>.broadcast();
  StreamSink<FoodAction> get eventSink => _eventStreamController.sink;
  Stream<FoodAction> get eventStream => _eventStreamController.stream;

  final _stateStreamController = StreamController<Food>.broadcast();
  StreamSink<Food> get statefoodSink => _stateStreamController.sink;
  Stream<Food> get statefoodStream => _stateStreamController.stream;

  FoodBloc() {
    eventStream.listen((event) async {
      if (event == FoodAction.Fetch) {
        try {
          var fooddata = await getfoodlist();

          if (fooddata != null)
            statefoodSink.add(fooddata);
          else
            statefoodSink.addError('Something went wrong!');
        } on Exception catch (e) {
          statefoodSink.addError('Something went wrong!');
        }
      }
    });
  }

  static Future<Food> getfoodlist() async {
    try {
      final response = await get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        print('FoodResponse : ${response.body}');

        Food fooddata = Food.fromJson(jsonDecode(response.body));

        return fooddata;
      } else {
        throw Exception('Not getting datas');
      }
    } catch (e) {
      throw Exception('Failed');
    }
  }

  @override
  void dispose() {
    print('stream close');
    _eventStreamController.close();
    _stateStreamController.close();
  }
}
