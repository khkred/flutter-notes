import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test 3"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){},child: Text("Click me to see a list"),),
      ),
    );
  }
}
