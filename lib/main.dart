import 'package:flutter/material.dart';
import 'package:quizz_app/answer.dart';
import 'package:quizz_app/question.dart';
import 'package:quizz_app/quiz.dart';
import 'package:quizz_app/result.dart';

void main() {
  runApp(MaterialApp(
    home: QuizzApp(),
  ));
}

class QuizzApp extends StatefulWidget {
  QuizzApp({Key? key}) : super(key: key);

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Elephant', 'score': 7},
        {'text': 'Hyena', 'score': 8},
        {'text': 'Lion', 'score': 10},
      ],
    },
    {
      'questionText': 'who\'s your favorite instructor',
      'answers': [
        {'text': 'Charles', 'score': 1},
        {'text': 'Elijah', 'score': 1},
        {'text': 'Adebola', 'score': 1},
        {'text': 'Jesuseyitan', 'score': 1},
      ],
    }
  ];

  int _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questions: _questions,
              questionIndex: _questionIndex,
              onPressed: _answerQuestion,
            )
          : Result(
              resultScore: _totalScore,
              onPressed: _resetQuiz,
            ),
    );
  }
}
