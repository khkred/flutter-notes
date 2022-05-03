import 'package:flutter/material.dart';
import 'package:pet_firebase/models/pet.dart';

class PetUi extends StatefulWidget {
  final Pet singlePet;

  PetUi(this.singlePet);

  @override
  State<PetUi> createState() => _PetUiState();
}

class _PetUiState extends State<PetUi> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/dogs.jpg"),
        Text(widget.singlePet.name),
      ],
    );
  }
}
