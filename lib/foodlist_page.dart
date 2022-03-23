import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newblocexg/Services.dart';
import 'package:newblocexg/bloc/food_bloc.dart';
import 'package:newblocexg/connection_helper.dart';
import 'package:newblocexg/model/Users.dart';
import 'package:newblocexg/model/foodmodel.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage() : super();

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  final foodBloc = FoodBloc();

  @override
  void initState() {
    setState(() {
      foodBloc.eventSink.add(FoodAction.Fetch);
      //foodBloc.eventSink.add(FoodAction.searchList);
    });
    super.initState();
  }

  @override
  void dispose() {
    foodBloc.dispose();
    print('close stream');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: StreamBuilder<Food>(
            stream: foodBloc.statefoodStream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return getList(context, snapshot);
            }),
      ),
    );
  }

  Widget getList(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    Food foodlst = snapshot.data;
    ListView myList = ListView.builder(
        itemCount: foodlst.recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(foodlst.recipes[index].title),
          );
        });
    return myList;
  }
}
