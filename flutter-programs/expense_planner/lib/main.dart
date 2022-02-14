import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense"),),
      body: Center(
        child: Text('This is the expense planner'),
      ),
    );
  }
}
