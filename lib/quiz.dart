import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function onPressed;
  final int questionIndex;

  Quiz(
      {required this.questions,
      required this.questionIndex,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          question: questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            answerText: answer['text'] as String,
            onPressed: () => onPressed(answer['score']),
          );
        }).toList()
      ],
    );
  }
}
