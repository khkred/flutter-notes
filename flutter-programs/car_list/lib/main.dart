import 'package:car_list/car_ui.dart';
import 'package:flutter/material.dart';

import 'car.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //Create a list of Cars

  var carsList = [
    Car("Ford", "F 150", "Gas", 120),
    Car("BMW", "X1", "Gas", 150),
    Car("Toyota", "Prius", "Hybrid", 100),
    Car("Tesla","Model S","Electric",140)
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Cars List"),),

        body: Column(
          children: carsList.map((car) => CarUI(car)).toList(),
        ),
      ),
    );
  }
}