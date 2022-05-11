import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:protagonists/models/character.dart';

class AddCharacterScreen extends StatefulWidget {

  Function addCharacters;

  AddCharacterScreen(this.addCharacters);

  @override
  State<AddCharacterScreen> createState() => _AddCharacterScreenState();
}

class _AddCharacterScreenState extends State<AddCharacterScreen> {
  DateTime selectedDate = DateTime.now();

  String characterName = "";
  int characterAge = 0;
  String characterSkills = "";
  String inGame = "";
  String creationDate = "";

  _selectDate(BuildContext context) async {

    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: "Character's Name"),
                  onChanged: (name) {
                    setState(() {
                      characterName = name;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Character's Age"),
                  keyboardType: TextInputType.number,
                  onChanged: (age) {
                    setState(() {
                      characterAge = int.parse(age);
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Character's Skills"),
                  keyboardType: TextInputType.number,
                  onChanged: (skills) {
                    setState(() {
                      characterSkills = skills;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Game character is in"),
                  onChanged: (game) {
                    setState(() {
                      inGame = game;
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Pick Date"),
                      ElevatedButton(
                          onPressed: () {
                            _selectDate(context);
                          },
                          child: Text("Date Picker"))
                    ],
                  ),
                ),

                Container(

                    margin: const EdgeInsets.only(top: 90),
                    child: ElevatedButton(
                        onPressed: () {
                          if (characterName.isEmpty ||
                              characterAge == 0 ||
                              characterSkills.isEmpty ||
                              inGame.isEmpty) {
                            const snackBar = SnackBar(
                              content: Text("One of these fields is empty"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            creationDate =
                            "${selectedDate.day}-${selectedDate
                                .month}-${selectedDate.year}";
                            Character addedCharacter = Character(
                                name: characterName,
                                age: characterAge,
                                skills: characterSkills,
                                game: inGame);
                            addedCharacter.addDate(creationDate);

                            var character = Character(name: characterName, age: characterAge, skills: characterSkills, game: inGame);

                            widget.addCharacters(character);

                            addCharacterToFireStore(addedCharacter);
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Upload Character")))
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<DocumentReference> addCharacterToFireStore(Character addedCharacter) {
    return FirebaseFirestore.instance
        .collection('characterDetails')
        .add(<String, dynamic>{
      "characterName": addedCharacter.name,
      "characterAge": addedCharacter.age,
      "characterSkills": addedCharacter.skills,
      "inGame": addedCharacter.game,
      "creationDate": addedCharacter.creationDate
    });
  }
}
