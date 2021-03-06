import 'package:flutter/material.dart';

import '../screens/landing_screen.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ScoreScreen(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your score: ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
          new Text(score.toString() + "/" + totalQuestions.toString(),
              style: new TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold, fontSize: 50.0
              )
          ),
          new IconButton(
              icon: new Icon(Icons.arrow_right),
              color: Colors.white,
              iconSize: 50.0,
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (BuildContext context) => new LandingScreen()),
                      (Route route) => route == null
              ),
          )
        ],
      ),
    );
  }
}