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

  /**
   * The following method validates and submits data
   */

  void submitData(BuildContext context, String inputMake, String inputModel, double inputSpeed)
  {
    //Check if any of the values are empty or if the speed is negative.

    if(inputMake.isEmpty || inputModel.isEmpty || inputSpeed<=0)
      {
        return;
      }
    else {
      //Create a car object with valid values
      var car = Car(inputMake, inputModel, inputSpeed);

      widget.addCarToTheList(car);

      // The following line closes the bottom sheet

      Navigator.of(context).pop();


    }


  }

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

              //Validate and submit data

              submitData(context,makeController.text, modelController.text, double.parse(topSpeedController.text));


            },
            child: Text("Submit")),
      ],
    );
  }
}
