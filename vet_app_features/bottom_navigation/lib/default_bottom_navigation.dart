import 'package:flutter/material.dart';

class DefaultBottomNavigation extends StatefulWidget {
  const DefaultBottomNavigation({Key? key}) : super(key: key);

  @override
  State<DefaultBottomNavigation> createState() => _DefaultBottomNavigationState();
}

class _DefaultBottomNavigationState extends State<DefaultBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Default Bottom Navigation'),
      ),
    );
  }
}
