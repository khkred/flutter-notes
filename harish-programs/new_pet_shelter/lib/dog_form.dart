import 'package:flutter/material.dart';

import 'dog.dart';
import 'dog_list.dart';

class DogForm extends StatefulWidget {
  const DogForm({Key? key}) : super(key: key);

  @override
  _DogFormState createState() => _DogFormState();
}

class _DogFormState extends State<DogForm> {

  var dogList = [

    Dog(Name: 'Rover', Breed: 'German Shepherd', Age: 8, Weight: 5),
    Dog(Name: 'Lassie', Breed: 'German Shepherd', Age: 6, Weight: 8),
    Dog(Name: 'Chop', Breed: 'Rottweiler', Age: 8, Weight: 10)

  ];

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
          setState(() {
            dogList.add(Dog(Name: nameController.text,
                Breed: breedController.text,
                Age: int.parse(ageController.text),
                Weight: double.parse(weightController.text)));
          });
        }, child: Text('Submit')),
        DogWidgetList(dogList),

      ],
    );
  }
}
