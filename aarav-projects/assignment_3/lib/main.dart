import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

void modalButton(context){
  var modal = "";
  showModalBottomSheet(
    context: context,
    builder: (_){

    }
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment 3")
      ),
      body: Column(
        children: [
          Text("This is assignment 3"),
          ElevatedButton(onPressed: modalButton(context),child: ,)
        ],
      ),
    );
    
  }
}
