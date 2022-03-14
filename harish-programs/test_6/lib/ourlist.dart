import 'package:flutter/material.dart';

class OurList extends StatelessWidget {
  const OurList({
    Key? key,
    required this.itemList,
  }) : super(key: key);

  final List<String> itemList;

  @override
  Widget build(BuildContext context) {
      return ListView(
        children: itemList
            .map((item) => ListTile(title: Text(item)))
            .toList(),
      );
  }
}