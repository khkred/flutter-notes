import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function answerChoice;
  String buttonText;
  Answer(this.answerChoice,this.buttonText);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: ()=> answerChoice(buttonText),
        child: Text(buttonText),
      ),
    );
  }
}


