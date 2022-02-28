import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';


class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionsList;
  final index;
  final Function answerChoice;
  Quiz(this.questionsList,this.index, this.answerChoice);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionsList[index]['questionText'] as String),
        ...(questionsList[index]['answers'] as List)
            .map((option) => Answer(answerChoice, option))
            .toList()
      ],
    );
  }
}
