import 'package:flutter/material.dart';
import 'results.dart';
import 'question.dart';
import 'answer.dart';
import 'quiz.dart';

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
      'answers': ["Elephant", "Rhino", "Giraffe", "Blue Whale"]
    },
    {
      'questionText': "What is the full form of HTTP?",
      'answers': [
        "Hyper Text Telecommunication Project",
        "High Transfer Transmission Protocol",
        "Hyper Text Transfer Protocol"
      ]
    },
    {
      'questionText': "Who has the most subscribers on YouTube?",
      'answers': [
        "Pewdiepie",
        "T-Series",
        "Markiplier",
        "Mr Beast"
      ]
    },
    {
      'questionText': "Did Neil Armstrong really land on the moon?",
      'answers': [
        "Yes",
        "No"
      ]
    }
  ];

  // Get List of Questions

  var _index = 0;

  var correctAnswers = ["Andy Rubin",
    "Blue Whale",
    "Hyper Text Transfer Protocol",
    "T-Series",
    "Yes"];

  void answerChoice(String buttonText) {
      setState(() {
        if(buttonText == correctAnswers[_index])
          {
            score++;
          }
        _index++;
      });



    print(_index);
  }

  var score = 0;

void reset(){
  setState(() {
    _index = 0;
    score = 0;
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sample AppBar"),
        ),
        body: _index<_questionsList.length? Quiz(_questionsList,_index,answerChoice) : Results(score,reset),
      ),
    );
  }
}
