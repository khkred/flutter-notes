import 'package:flutter/material.dart';
import 'Car.dart';

/**
 * This is going to be the Car UI,
 * We'll have a list of this UI one below the another.
 */

class CarUI extends StatelessWidget {

  /**
   * Since we can only get the car details like model, make and top speed
   * from a car Object. We'll create a constructor that demands a Car Object.
   */
  
  final Car car;
  
  //Constructor to get the car object
  CarUI(this.car);
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //First child is a column , because it has model and make
            Column(
              children: [
                Text(car.model,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
                Text(car.make,
                style: TextStyle(
                  color: Colors.grey
                ),)
              ],
            ),
            //Second child is a Text Widget for the top speed
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: Text(car.topSpeed.toString(),style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontSize: 18,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
