import 'package:bottom_bar_flutter/first_screen.dart';
import 'package:bottom_bar_flutter/second_screen.dart';
import 'package:bottom_bar_flutter/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'fourth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;

  //list of widgets to call ontap
  final screenOptions = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
      FourthScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bottom Navigation Tutorial",
      home: Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) {
            setState(() {
              _currentIndex = i;
            });
          },
          items: [
            SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("First"),
                selectedColor: Colors.blueAccent),
            SalomonBottomBarItem(
                icon: const Icon(Icons.ac_unit),
                title: const Text("Second"),
                selectedColor: Colors.redAccent),
            SalomonBottomBarItem(
                icon: const Icon(Icons.access_time),
                title: const Text("Third"),
                selectedColor: Colors.greenAccent),
            SalomonBottomBarItem(
                icon: const Icon(Icons.accessibility_new_outlined),
                title: Text("Fourth"),
                selectedColor: Colors.yellowAccent)
          ],
        ),
        body: screenOptions.elementAt(_currentIndex),
      ),
    );
  }
}
