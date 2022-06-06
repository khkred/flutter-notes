import 'package:flutter/material.dart';
import 'package:pet_firebase/models/pet.dart';
import 'package:pet_firebase/screens/pet_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPets extends StatefulWidget {

  @override
  State<ListPets> createState() => _ListPetsState();
}

void listPet() {}

final Stream<QuerySnapshot> _usersStream =
FirebaseFirestore.instance.collection('petsDetails').snapshots();

@override
class _ListPetsState extends State<ListPets> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
          body: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data()! as Map<String, dynamic>;
              return PetUi(petName: data["petName"], age: data["petAge"],);
            }).toList(),
          ),
        );
      },
    );
  }
}
