import 'package:flutter/material.dart';
import 'Dog.dart';

/**
 * This is going to be the Dog UI,
 * We'll have a list of this UI one below the another.
 */

class DogUI extends StatelessWidget {

  /**
   * Since we can only get the Dog details like name, breed and age
   * from a dog Object. We'll create a constructor that demands a dog Object.
   */

  final Dog dog;

  DogUI(this.dog);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(dog.Name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),),
                Text(dog.Breed,
                  style: TextStyle(
                      color: Colors.grey
                  ),)
              ],
            ),
            //Second child is a Text Widget for the top speed
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.purple
                  )
              ),
              child: Text(dog.Age.toString(),style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontSize: 18,
              ),),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.purple
                  )
              ),
              child: Text(dog.Weight.toString(),style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
                fontSize: 18,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

