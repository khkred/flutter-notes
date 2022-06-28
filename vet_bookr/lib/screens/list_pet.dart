import 'package:flutter/material.dart';
import 'package:vet_bookr/models/pet.dart';
import 'package:vet_bookr/screens/pet_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vet_bookr/screens/symptoms.dart';

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
          body: Column(
            children: [
              ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
                  return PetUi(petName: data["petName"], age: data["petAge"],);
                }).toList(),
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Symptoms()));
              }, child: Text("Next"))
            ],
          ),
        );
      },
    );
  }
}
