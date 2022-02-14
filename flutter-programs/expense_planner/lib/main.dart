import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Budget Planner"),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.red,
                child: Text("Chart"),
                elevation: 5,
              ),
            ),
            Card(
              color: Colors.amber,
              child: Text("Transaction"),
            ),
          ],
        ));
  }
}
