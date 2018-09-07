import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

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
            new Expanded(
              child: new Material( // True Button
                color: Colors.greenAccent,
                child: new InkWell(
                  onTap: () => print("You answered true"),
                  child: new Center(
                    child: new Container(
                      child: new Text("True"),
                    ),
                  ),
                ),
              ))
          ],
        ),
      ],
    );
  }
}