import 'package:cars_list/carForm.dart';
import 'package:cars_list/Car.dart';
import 'package:cars_list/car_list.dart';
import 'package:flutter/material.dart';

import 'CarUI.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List of Car Objects
  var carList = [
    Car("Tesla", "Model 3", 230),
    Car("BMW", "X1", 180),
    Car("Mercedes", "C Class", 192),
    Car("Toyota", "Camaro", 200),
    Car("Ford", "F 150", 140),
    Car("GMC", "Ram", 135),
    Car("Mitsubishi", "Pajero", 167)
  ];

  /**
   * This method is called when the plus buttons are clicked
   */

  void addNewCar(BuildContext context) {
    //Show Modal Bottom Sheet is a inbuilt widget defined by flutter.
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            child: CarForm(addCarToTheList),
            onTap: (){},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void addCarToTheList(Car car)
  {
    setState(() {
      carList.add(car);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewCar(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CarList(carList),
    );
  }
}
