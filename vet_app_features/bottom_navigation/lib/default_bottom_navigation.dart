import 'package:bottom_navigation/screens/pets_list.dart';
import 'package:bottom_navigation/screens/pharmacies_list.dart';
import 'package:bottom_navigation/screens/vets_list.dart';
import 'package:flutter/material.dart';

class DefaultBottomNavigation extends StatefulWidget {



  @override
  State<DefaultBottomNavigation> createState() =>
      _DefaultBottomNavigationState();
}

class _DefaultBottomNavigationState extends State<DefaultBottomNavigation> {

  int _selectedIndex = 0;

  List<Widget> pages = [
    PetsList(),
    VetsList(),
    PharmaciesList(),
  ];

  void _onItemPressed(int  index){
    setState((){
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pets'),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Vets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy),
            label: 'Pharmacies',
          ),
        ],
        onTap: _onItemPressed,
      ),
    );
  }
}
