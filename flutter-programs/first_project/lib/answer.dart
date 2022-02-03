import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPressedFunction;
  String buttonText;
  Answer(this.onPressedFunction,this.buttonText);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: ()=> onPressedFunction(),
        child: Text(buttonText),
      ),
    );
  }
}

