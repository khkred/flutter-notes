import 'package:flutter/material.dart';

class LVChildren extends StatelessWidget {

  final List<String> thousandList;
  LVChildren(this.thousandList);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: thousandList.map((item) => ListTile(title: Text(item),)).toList(),
    );
  }
}
