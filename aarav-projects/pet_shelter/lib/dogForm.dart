import 'package:flutter/material.dart';

class DogForm extends StatefulWidget {


  @override
  _DogFormState createState() => _DogFormState();
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
          decoration: InputDecoration(
              labelText: 'Name:'
          ),
        ),
        TextField(
          controller: breedController,
          decoration: InputDecoration(
              labelText: 'Breed:'
          ),
        ),
        TextField(
          controller: ageController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Age:'
          ),
        ),
        TextField(
          controller: weightController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Weight:'
          ),
        ),
        TextButton(onPressed: (){
          setState(() {
            print(nameController.text);
            print(breedController.text);
            print(ageController.text);
            print(weightController.text);
          });
        }, child: Text("Submit"))
      ],
    );
  }
}
