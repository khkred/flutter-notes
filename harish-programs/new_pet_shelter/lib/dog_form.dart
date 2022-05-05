import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dog.dart';

import 'dart:async';

class DogForm extends StatefulWidget{

  Function addDogs;

  DogForm(this.addDogs);

  @override
  State<DogForm> createState() => _DogFormState();
}

class _DogFormState extends State<DogForm> {


  final nameController = TextEditingController();

  final breedController = TextEditingController();

  final ageController = TextEditingController();

  final weightController = TextEditingController();

  void submitData(String inputName, String inputBreed, int inputAge, double inputWeight){

    if(inputName.isEmpty || inputBreed.isEmpty || inputAge <= 0 || inputWeight <= 0){
      return;
    }
    else{
      var dog = Dog(name: inputName, breed: inputBreed, age: inputAge, weight: inputWeight);

      widget.addDogs(dog);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Name:'),
        ),
        TextField(
          controller: breedController,
          decoration: InputDecoration(labelText: 'Breed:'),
        ),
        TextField(
          controller: ageController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Age:'),
        ),
        TextField(
          controller: weightController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Weight:'),
        ),
        TextButton(onPressed: () {
          submitData(nameController.text, breedController.text, int.parse(ageController.text), double.parse(weightController.text));  
        }, child: Text('Submit')),

      ],
    );
  }
}
