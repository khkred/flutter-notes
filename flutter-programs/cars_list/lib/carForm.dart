import 'package:flutter/material.dart';
import 'package:cars_list/CarUI.dart';
import 'package:cars_list/Car.dart';

class CarForm extends StatefulWidget {
  List<Car> carList;

  CarForm({Key key = const Key('carForm'), required this.carList})
      : super(key: key);

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

                widget.carList.add(car);
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
