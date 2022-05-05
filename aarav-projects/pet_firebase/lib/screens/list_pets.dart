import 'package:flutter/material.dart';
import 'package:pet_firebase/models/pet.dart';
import 'package:pet_firebase/screens/pet_ui.dart';

class ListPets extends StatefulWidget {

  List<Pet> petList;

  String users;

  ListPets(this.petList,this.users);

  @override
  State<ListPets> createState() => _ListPetsState();
}

void listPet(){
}

class _ListPetsState extends State<ListPets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
              widget.petList.map((e) => PetUi(e)).toList()
            ,
          ),
        ),
      ],
    );
  }
}
