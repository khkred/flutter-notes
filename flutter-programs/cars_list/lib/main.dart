import 'package:cars_list/carForm.dart';
import 'package:cars_list/Car.dart';
import 'package:flutter/material.dart';

import 'CarUI.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // List of Car Objects

  var carList = [
    Car("Tesla", "Model 3", 230),
    Car("BMW", "X1", 180),
    Car("Mercedes", "C Class", 192)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
      ),
      body: CarForm(
        carList: carList,
      ),
    );
  }
}
