import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model'),
      ),
      body: Container(
        height: 200,
        width: 100,
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: NetworkImage('https://image.tmdb.org/t/p/w500/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg',
            ),
            fit: BoxFit.fill
          )
        ),
      ),
    );
  }
}
