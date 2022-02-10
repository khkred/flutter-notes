import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final score;

  Results(this.score);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Your score is: $score." ),
    );
  }
}
