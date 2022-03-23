import 'package:flutter/material.dart';
import 'package:newblocexg/JsonParseDemo.dart';
import 'package:newblocexg/foodlist_page.dart';
import 'package:newblocexg/userPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserPage(),
    );
  }
}
