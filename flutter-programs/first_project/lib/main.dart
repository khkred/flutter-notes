import 'package:flutter/material.dart';

import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionsList = [
    "First Question",
    "Second Question",
    "Third Question",
    "Fourth Question"
  ];

  var _index = 0;

  void answerChoice() {
    print("Button is clicked");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sample AppBar"),
        ),
        body: Column(
          children: [
            Question(_questionsList[_index]),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
              child: Text("Answer 1"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _index = 2;
                });
              },
              child: Text("Answer 2"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _index = 3;
                });
              },
              child: Text("Answer 3"),
            )
          ],
        ),
      ),
    );
  }
}
