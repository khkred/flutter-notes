import 'package:flutter/material.dart';

void main() {
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [],
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            padding: EdgeInsets.all(10),
            child: Card()
        ),
        Container(
          child: Text("This is assignment 2", style: TextStyle(fontSize: 30),),
        )
      ],
    );
  }
}



