import 'package:flutter/material.dart';
import 'package:names_list/lv_builder.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  var numberList = List<int>.generate(10, (index) => index);

  //List of 1000 Strings

  var thousandList = List<String>.generate(1000, (index) => 'Item ${index+1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Names List"),
      ),

      body: LVBuilder(thousandList),
    );
  }
}
