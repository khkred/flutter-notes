import 'package:car_list/car.dart';
import 'package:flutter/material.dart';

class CarUI extends StatelessWidget {

  //The information for the UI can be acquired only through a car object

  final Car car;

  CarUI(this.car);

  @override
  Widget build(BuildContext context) {

    //Row with 3 children
    return Card(
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //First child
            Text(car.topSpeed.toString()),

            //Second Child
            Column(
              children: [
                Text(car.make),
                Text(car.model)
              ],
            ),

            //Third Child
            Text(car.fuelType)

          ],
        ),
      ),
    );
  }
}
