import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class AdvancedBottomNavigation extends StatefulWidget {
  const AdvancedBottomNavigation({Key? key}) : super(key: key);

  @override
  State<AdvancedBottomNavigation> createState() =>
      _AdvancedBottomNavigationState();
}

class _AdvancedBottomNavigationState extends State<AdvancedBottomNavigation> {
  var _bottomNavIndex = 0;

  final iconsList = <IconData>[
    Icons.home,
    Icons.local_hospital,
    Icons.local_drink,
    Icons.local_pharmacy,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        onTap: (index) => setState(() => _bottomNavIndex = index),
        icons: iconsList,
        activeIndex:  _bottomNavIndex,
      ),
      body: Center(
        child: Text("$_bottomNavIndex"),
      ),
    );
  }
}
