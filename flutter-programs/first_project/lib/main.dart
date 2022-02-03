import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

void main() => runApp(MyApp());

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
    setState(() {
      _index++;
    });

    print(_index);
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
            Answer(answerChoice),
            ElevatedButton(onPressed: answerChoice, child: Text("Answer 2")),

          ],
        ),
      ),
    );
  }
}
