import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  var namesList = [
    "Trevor","Franklin","Michael","Brad","Lester","Lamar","Ron","Jimmy","Amanda","Tracey"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child:Column(
              children: namesList.map((e) => Container(height: 25,margin: EdgeInsets.all(25.0),decoration: BoxDecoration(border: Border.all()),child: Text(e,style: TextStyle(fontSize: 20),))).toList(),
            )

        ),
      ),
    );
  }
}
