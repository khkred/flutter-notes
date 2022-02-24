import 'package:flutter/material.dart';

class SingleChild extends StatelessWidget {

  final List<String> thousandList;

  SingleChild(this.thousandList);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: thousandList.map((item) => ListTile(title: Text(item),)).toList(),
      ),

    );
  }
}
