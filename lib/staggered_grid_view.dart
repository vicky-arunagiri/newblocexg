/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newblocexg/Services.dart';
import 'package:newblocexg/bloc/food_bloc.dart';
import 'package:newblocexg/model/foodmodel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridView extends StatefulWidget {
  const StaggeredGridView() : super();

  @override
  _StaggeredGridViewState createState() => _StaggeredGridViewState();
}

class _StaggeredGridViewState extends State<StaggeredGridView> {
  //late List<User> _users;
  //late bool _loading;
  final foodBloc = FoodBloc();

  @override
  void initState() {
    setState(() {
      foodBloc.eventSink.add(FoodAction.Fetch);
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
        title: Text('Loading...'),
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
              // return getStaggeredGridView(context, snapshot);
            }),
      ),
    );
  }

  Widget getList(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    Food foodlst = snapshot.data;
    StaggeredGridView stg = StaggeredGridView.countBuilder(
      staggeredTileBuilder: (index) =>
          StaggeredTile.fit(1), //cross axis cell count
      mainAxisSpacing: 8, // vertical spacing between items
      crossAxisSpacing: 8, // horizontal spacing between items
      crossAxisCount: 2, // no. of virtual columns in grid
      itemCount: 60,
      itemBuilder: (context, index) => buildImageCard(index),
    );
    //);
    return stg;
    */
/* ListView myList = ListView.builder(
        itemCount: foodlst.recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(foodlst.recipes[index].title),
          );
        });*/ /*

    //return myList;
  }

  Widget buildImageCard(int index) => Card(
        color: Colors.white,
        // margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          margin: EdgeInsets.all(4),
          child: ClipRRect(
              // clip the image to a circle
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://source.unsplash.com/random?sig=$index',
                fit: BoxFit.cover,
              )),
        ),
      );
  */
/*Widget getStaggeredGridView(BuildContext context,AsyncSnapshot<dynamic> snapshot){
    return Expanded(
        child: new StaggeredGridView.countBuilder((
        crossAxisCount: 2,
        itemCount: images.length,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemBuilder: (context, index) {
      return Container(
        child: Card(
          child: Column(
            children: [
              Image.network(images[index]),
              Text("Some Text"),
            ],
          ),
        ),
      );
    },
    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
    ));*/ /*


}
*/
