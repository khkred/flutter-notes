import 'package:pet_shelter/Dog.dart';
import 'package:pet_shelter/dogForm.dart';
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
    Dog("Rover", "German Sheperd", 8,5),
    Dog("Lassie", "German Sheperd", 6,8),
    Dog("Chop", "Rottweiler", 8,10)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dogs'),
      ),
      body: Column(
        children: [
          DogForm(),

          Column(
            children: dogList.map((dog) => DogUI(dog)).toList(),
          ),
        ],
      ),
    );
  }
}


