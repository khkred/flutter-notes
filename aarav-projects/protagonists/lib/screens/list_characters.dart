import 'package:flutter/material.dart';
import 'character_ui.dart';
import 'package:characters/characters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CharacterList extends StatefulWidget {

  @override
  State<CharacterList> createState() => _CharacterListState();
}


final Stream<QuerySnapshot> _usersStream =
FirebaseFirestore.instance.collection('characterDetails').snapshots();

@override
class _CharacterListState extends State<CharacterList> {
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
              return CharacterUi(characterName: data["characterName"], characterAge: data["characterAge"],);
            }).toList(),
          ),
        );
      },
    );
  }
}
