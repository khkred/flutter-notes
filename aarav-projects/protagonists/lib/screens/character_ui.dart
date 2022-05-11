import 'package:flutter/material.dart';
import 'package:characters/characters.dart';

class CharacterUi extends StatefulWidget {
  String characterName;
  int characterAge;
  String characterSkills;
  String inGame;

  CharacterUi({required this.characterName, required this.characterAge, this.characterSkills = "", this.inGame = ""});

  @override
  State<CharacterUi> createState() => _CharacterUiState();
}

class _CharacterUiState extends State<CharacterUi> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: Image.asset("assets/protagonist.jpg")),
        Text(widget.characterName),
      ],
    );
  }
}
