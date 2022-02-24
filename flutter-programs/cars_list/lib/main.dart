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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
      ),
      body: CarForm(),
    );
  }
}
