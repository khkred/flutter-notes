import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questionText;

  // We can pass data to a class through constructors.
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
