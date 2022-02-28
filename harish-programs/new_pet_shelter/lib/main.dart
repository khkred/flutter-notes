import 'package:flutter/material.dart';

import 'dog_form.dart';
void main() {

  runApp(
      MaterialApp(
        home: MyApp(),
      )
  );

}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dogs'),
      ),

      body: Column(
        children: [DogForm()],
      ),
    );
  }
}
