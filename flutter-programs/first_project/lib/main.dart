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

  var questionAndAnswers =
  {
    "Who invented Android?":  [
      "Larry Page",
      "Mark Zuckerberg",
      "Andy Rubin",
      "Matt Le Blanc"
    ],
    "What is the largest mammal on Earth?": [
      "Elephant",
      "Rhino",
      "Giraffe",
      "Human"
    ],
    "What is the full form of HTTP?": [
      "Hyper Text Telecommunication Project",
      "High Transfer Transmission Protocol",
      "Hyper Text Transfer Protocol"
    ]
  };

  List questionsList = [];


  // Get List of Questions


  var _index = 0;

  void answerChoice() {
    setState(() {
      _index++;
    });

    print(_index);
  }

  void printTheList()
  {
    print(questionsList);
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
            Question(questionsList[_index]),
            Answer(answerChoice,'Answer 1'),
            Answer(answerChoice,'Answer 2'),
            ElevatedButton(onPressed: printTheList, child: Text("Print the list")),

          ],
        ),
      ),
    );
  }
}
