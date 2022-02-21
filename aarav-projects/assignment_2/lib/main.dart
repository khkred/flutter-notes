import 'package:flutter/material.dart';

void main() {
  //Every App needs a MaterialApp in main.dart
  
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    //The build method inside main.dart needs scaffold
    return Scaffold(
      appBar: AppBar(title: Text("Assignment 2"),),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [Text("First Child"),
              Text(("Second Child"))],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              padding: EdgeInsets.all(10),
              child: Card(
                child: Text("This is a card"),
              )
          ),
          Container(
            child: Text("This is assignment 2", style: TextStyle(fontSize: 30),),
          )
        ],
      ),
    );
  }
}



