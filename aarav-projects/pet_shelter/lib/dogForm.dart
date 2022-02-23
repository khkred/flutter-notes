import 'package:flutter/material.dart';
import 'DogUI.dart';
import 'Dog.dart';


class DogForm extends StatefulWidget {
  List<Dog> dogList;

  DogForm({Key key = const Key('dogForm'), required this.dogList})
      : super(key: key);

  @override
  _CarFormState createState() => _CarFormState();
}

class _CarFormState extends State<DogForm> {
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
        TextButton(
            onPressed: () {
              setState(() {
                var dog = Dog(nameController.text, breedController.text,
                    double.parse(ageController.text));

                widget.dogList.add(dog);
              });

            },
            child: Text("Submit")),
        Column(
          // We will map each object's model from carList to a Card
          children: widget.carList.map((car) => CarUI(car)).toList(),
        )
      ],
    );
  }
}
