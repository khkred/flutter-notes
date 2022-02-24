import 'Dog.dart';
import 'dogForm.dart';
import 'package:flutter/material.dart';
import 'DogUI.dart';
void main() {

  runApp(
      MaterialApp(
        home: MyApp(),
      )
  );

}

class MyApp extends StatelessWidget {


  var dogList = [

    Dog(Name: 'Rover', Breed: 'German Shepherd', Age: 8, Weight: 5),
    Dog(Name: 'Lassie', Breed: 'German Shepherd', Age: 6, Weight: 8),
    Dog(Name: 'Chop', Breed: 'Rottweiler', Age: 8, Weight: 10)

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dogs'),
      ),
      body: Column(
        children: [
          DogForm(dogList: [],),

          Container(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                children: dogList.map((dog) => DogUI(dog)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


