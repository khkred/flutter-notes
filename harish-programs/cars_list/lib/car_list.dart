import 'package:cars_list/Car.dart';
import 'package:flutter/material.dart';
import 'package:cars_list/CarUI.dart';


class CarList extends StatelessWidget {

  final List<Car> carList;
  CarList(this.carList);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // We will map each object's model from carList to a Card
      children: carList.map((car) => CarUI(car)).toList(),
    );
  }
}
