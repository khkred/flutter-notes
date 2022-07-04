import 'package:bottom_navigation/advanced_bottom_navigation.dart';
import 'package:bottom_navigation/default_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const MaterialApp( home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
    );
  }
}
