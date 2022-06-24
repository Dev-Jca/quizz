import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function() onPressed;
  const Answer({
    required this.answerText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        // style: ElevatedButton.styleFrom(primary: Colors.blue),
        onPressed: onPressed,
        child: Text(
          answerText,
        ),
      ),
    );
  }
}
