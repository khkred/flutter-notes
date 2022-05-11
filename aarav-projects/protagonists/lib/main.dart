import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:protagonists/models/character.dart';
import 'package:protagonists/screens/add_character.dart';
import 'package:protagonists/screens/list_characters.dart';

void main() async {
  //Ensure that all the widgets are binding before running the firebase app
  WidgetsFlutterBinding.ensureInitialized();

  //Getting Firebase Instance in our app
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData.dark(),
  ));
}

List<Character> listCharacter = [];

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void addCharacter(character) {
    setState(() {
      listCharacter.add(character);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CharacterList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCharacterScreen(addCharacter)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// Within the `FirstRoute` widget
