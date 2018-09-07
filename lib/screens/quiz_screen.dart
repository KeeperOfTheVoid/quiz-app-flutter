import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import '../ui/answer_button.dart';

class QuizScreen extends StatefulWidget {
  @override
  State createState() => new QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          // This is our main screen
          children: <Widget>[
            new AnswerButton(true, () => print("You answered true")),
            new AnswerButton(false, () => print("You answered false"))
          ],
        ),
      ],
    );
  }
}
