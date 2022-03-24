import 'package:flutter/material.dart';

void main() {
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
        title: Text('Grid View'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

        children: [
          Image.asset('images/poster1.jpg'),
          Image.asset('images/poster2.jpg'),
          Image.asset('images/poster3.jpg'),
          Image.asset('images/poster4.jpg'),
          Image.asset('images/poster5.jpg'),
          Image.asset('images/poster6.jpg'),

        ],
      ),
    );
  }
}
