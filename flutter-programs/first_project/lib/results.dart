import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final score;

  Results(this.score);

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
          ElevatedButton(onPressed: (){}, child: Text("Reset Quiz")),
        ]
      ),
    );
  }
}
