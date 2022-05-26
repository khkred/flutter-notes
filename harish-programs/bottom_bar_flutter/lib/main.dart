import 'package:bottom_bar_flutter/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
void main() {
  runApp(const MaterialApp(home: MyApp(),));
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i){
          setState(() {
            _currentIndex =i;
            print(_currentIndex);
          });
        }, items: [
          SalomonBottomBarItem(icon: const Icon(Icons.home), title: const Text("First"),selectedColor: Colors.blueAccent),
        SalomonBottomBarItem(icon: const Icon(Icons.ac_unit), title: const Text("Second"),selectedColor: Colors.redAccent),
        SalomonBottomBarItem(icon: const Icon(Icons.access_time), title: const Text("Third"),selectedColor: Colors.greenAccent)
      ],
      ),
      body: FirstScreen(),
    );
  }
}