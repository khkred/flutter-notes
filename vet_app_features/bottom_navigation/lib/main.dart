import 'package:bottom_navigation/advanced_bottom_navigation.dart';
import 'package:bottom_navigation/default_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DefaultBottomNavigation()));
                  },
                  child: const Text('Default Bottom Navigation')),
              const SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdvancedBottomNavigation()));
                  },
                  child: const Text('Advanced  Bottom Navigation'))
            ],
          ),
        ),
      ),
    );
  }
}
