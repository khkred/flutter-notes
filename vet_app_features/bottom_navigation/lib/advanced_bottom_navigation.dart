import 'package:flutter/material.dart';

class AdvancedBottomNavigation extends StatefulWidget {
  const AdvancedBottomNavigation({Key? key}) : super(key: key);

  @override
  State<AdvancedBottomNavigation> createState() => _AdvancedBottomNavigationState();
}

class _AdvancedBottomNavigationState extends State<AdvancedBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Advanced Bottom Navigation'),
      ),
    );
  }
}
