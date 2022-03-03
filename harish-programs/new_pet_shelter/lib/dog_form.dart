import 'package:flutter/material.dart';

import 'dog.dart';
import 'dog_list.dart';

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
            var dog = Dog(Name: nameController.text, Breed: breedController.text, Age: int.parse(ageController.text), Weight: double.parse(weightController.text));
            widget.addDogs(dog);
        }, child: Text('Submit')),

      ],
    );
  }
}
