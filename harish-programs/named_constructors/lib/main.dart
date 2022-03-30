import 'package:flutter/material.dart';

import 'greeting.dart';
import 'named_greeting.dart';

void main() {
  runApp(MaterialApp( home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Click me'),
          onPressed: ()
          {
            Greeting('Aarav',14,"Gamer");

            NamedGreeting(occupation: "Gamer", age: 23, name: "Harish");
          },
        ),
      ),
    );
  }
}
