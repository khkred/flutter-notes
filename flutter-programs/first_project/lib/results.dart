import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final score;
  final Function reset;

  Results(this.score, this.reset);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            "Your score is: $score.",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
          ),
          ElevatedButton(onPressed: reset(), child: Text("Reset Quiz")),
        ]
      ),
    );
  }
}
