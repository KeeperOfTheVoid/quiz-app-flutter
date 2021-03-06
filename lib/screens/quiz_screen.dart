import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import '../ui/answer_button.dart';
import '../ui/question_text.dart';
import '../ui/answer_overlay.dart';

import '../screens/score_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  State createState() => new QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Pizza is nice", true),
    new Question("Fluter is awesome", true),
    new Question("Making apps is hard", false)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool isOverlayVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      isOverlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          // This is our main screen
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)), // True Button
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)) // False button
          ],
        ),
        isOverlayVisible == true ? new AnswerOverlay(
            isCorrect,
            () {
              if (quiz.length == questionNumber) {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(builder: (BuildContext context) => new ScoreScreen(quiz.score, quiz.length)),
                    (Route route) => route == null
                );
                return;
              }
              currentQuestion = quiz.nextQuestion;
              this.setState(() {
                isOverlayVisible = false;
                questionText = currentQuestion.question;
                questionNumber = quiz.questionNumber;
              });
            }
        ) : new Container()
      ],
    );
  }
}
