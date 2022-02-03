import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPressedFunction;

  Answer(this.onPressedFunction);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()=> onPressedFunction(),
      child: Text("Custom Widget"),
    );
  }
}


