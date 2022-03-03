import 'package:flutter/material.dart';
import 'package:cars_list/Car.dart';

class CarForm extends StatefulWidget{

  Function addCarToTheList;

  CarForm(this.addCarToTheList);

  @override
  State<CarForm> createState() => _CarFormState();
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
          decoration: InputDecoration(labelText: 'Make:'),
        ),
        TextField(
          controller: modelController,
          decoration: InputDecoration(labelText: 'Model:'),
        ),
        TextField(
          controller: topSpeedController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Top Speed:'),
        ),
        TextButton(
            onPressed: () {
                var car = Car(makeController.text, modelController.text,
                    double.parse(topSpeedController.text));

                widget.addCarToTheList(car);

            },
            child: Text("Submit")),
      ],
    );
  }
}
