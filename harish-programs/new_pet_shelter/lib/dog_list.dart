import 'package:flutter/material.dart';

import 'dog_ui.dart';
import 'dog.dart';

class DogWidgetList extends StatelessWidget {
  final List<Dog> dogList;

  DogWidgetList(this.dogList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
          // We will map each object's model from carList to a Card
          children: dogList.map((dog) => DogUI(dog)).toList()),
    );
  }
}
