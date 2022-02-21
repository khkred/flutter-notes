import 'package:flutter/material.dart';

class CarForm extends StatefulWidget {


  @override
  _CarFormState createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {

  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final topSpeedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: makeController,
          decoration: InputDecoration(
              labelText: 'Make:'
          ),
        ),
        TextField(
          controller: modelController,
          decoration: InputDecoration(
              labelText: 'Model:'
          ),
        ),
        TextField(
          controller: topSpeedController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Top Speed:'
          ),
        ),
        TextButton(onPressed: (){
         setState(() {
           print(makeController.text);
           print(modelController.text);
           print(topSpeedController.text);
         });
        }, child: Text("Submit"))
      ],
    );
  }
}
