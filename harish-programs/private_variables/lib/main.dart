import 'package:flutter/material.dart';
import 'bicycle.dart';

void main()
{
  runApp(MaterialApp(
    home: MyApp(),
  ));

}

class MyApp extends StatelessWidget {

  var bike = Bicycle(4, 5, 6);

  void changeValues()
  {
    bike.cadence = 5;
    bike.gear = 6;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Private'),),

      body: Center(
        child: Text(bike.speed.toString()),
      ),
    );
  }
}
