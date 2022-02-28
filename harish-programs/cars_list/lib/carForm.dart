import 'package:flutter/material.dart';
import 'package:cars_list/CarUI.dart';
import 'package:cars_list/Car.dart';

class CarForm extends StatefulWidget {


  @override
  _CarFormState createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {

  var carList = [
    Car("Tesla", "Model 3", 230),
    Car("BMW", "X1", 180),
    Car("Mercedes", "C Class", 192),
    Car("Toyota","Camaro",200),
    Car("Ford","F 150",140),
    Car("GMC", "Ram", 135),
    Car("Mitsubishi", "Pajero", 167)
  ];
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
              setState(() {
                var car = Car(makeController.text, modelController.text,
                    double.parse(topSpeedController.text));

                carList.add(car);
              });

            },
            child: Text("Submit")),
        Container(
          decoration: BoxDecoration(
            border: Border.all()
          ),
          height: 500,
          child: SingleChildScrollView(
            child: Column(
              // We will map each object's model from carList to a Card
              children: carList.map((car) => CarUI(car)).toList(),
            ),
          ),
        )
      ],
    );
  }
}
