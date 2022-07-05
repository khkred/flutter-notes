import 'dart:convert';
import 'package:final_nearby_vets/MapsOfVets.dart';
import 'package:final_nearby_vets/listOfVets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;

  List<Widget> screens = [ListVets(), VetsMaps()];

  void _onItemPressed(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
        BottomNavigationBarItem(icon: Icon(Icons.location_on_sharp), label: "Maps")
        ],
        onTap: _onItemPressed,
      ),
    );
  }

}
