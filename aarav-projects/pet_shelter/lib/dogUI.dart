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
                Text(dog.Name),
                Text(dog.Breed),
                Text(dog.Age.toString())
              ],
            ),

            Text(dog.Age.toString()),
          ],
        ),
      ),
    );
  }
}
