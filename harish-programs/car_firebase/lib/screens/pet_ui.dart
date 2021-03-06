import 'package:flutter/material.dart';
import 'package:car_firebase/models/pet.dart';

class PetUi extends StatefulWidget {
  String petName;
  int age;
  double weight;
  String breed;

  PetUi({required this.petName, required this.age, this.weight = 0.0, this.breed = ""});

  @override
  State<PetUi> createState() => _PetUiState();
}

class _PetUiState extends State<PetUi> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: Image.asset("assets/dogs.jpg")),
        Text(widget.petName),
      ],
    );
  }
}
