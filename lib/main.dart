import 'package:flutter/material.dart';
import 'package:quizz_app/answer.dart';
import 'package:quizz_app/question.dart';

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
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'what\'s your favorite color?',
        'answers': [
          'Black',
          'Red',
          'Green',
          'White',
        ],
      },
      {
        'questionText': 'what\'s your favorite animal',
        'answers': [
          'Rabbit',
          'Elephant',
          'Hyena',
          'Lion',
        ],
      },
      {
        'questionText': 'who\'s your favorite instructor',
        'answers': [
          'Charles',
          'Elijah',
          'Adebola',
          'Jesuseyitan',
        ],
      }
    ];

    void answerQuestion() {
      setState(() {
        if (questionIndex < questions.length - 1) {
          questionIndex++;
        } else {
          questionIndex = 0;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz'),
      ),
      body: Column(
        children: [
          Question(
            question: questions[questionIndex]['questionText'].toString(),
          ),
          ...(questions[questionIndex]['answers'] as List<String>)
              .map((element) {
            return Answer(
                answerText: element,
                onPressed: () {
                  answerQuestion();
                });
          }).toList()
        ],
      ),
    );
  }
}
