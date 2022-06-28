import 'package:flutter/material.dart';

class Clinics_List extends StatelessWidget {
  const Clinics_List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),)
        ],
      ),
    );
  }
}
