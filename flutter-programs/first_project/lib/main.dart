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
  final _questionsList = const [
    {
      'questionText': "Who invented Android?",
      'answers': [
        "Larry Page",
        "Mark Zuckerberg",
        "Andy Rubin",
        "Matt Le Blanc"
      ]
    },
    {
      'questionText': "What is the largest mammal on Earth?",
      'answers': ["Elephant", "Rhino", "Giraffe", "Human"]
    },
    {
      'questionText': "What is the full form of HTTP?",
      'answers': [
        "Hyper Text Telecommunication Project",
        "High Transfer Transmission Protocol",
        "Hyper Text Transfer Protocol"
      ]
    }
  ];

  // Get List of Questions

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
        body: if (_index < _questionsList.length){
          Column(
          children: [
          Question(_questionsList[_index]['questionText'] as String),
    ...(_questionsList[_index]['answers'] as List).map(
    (option) => Answer(answerChoice, option)
    ).toList()
    ]
    ),
    }
      ),
    );
  }
}
