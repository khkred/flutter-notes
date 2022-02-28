import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//Anything that we see on the screen is a widget

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Center(
          child: const Text("Hello World"),
        ),
      ),
    );
  }
}
