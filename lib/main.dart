import 'package:flutter/material.dart';
import 'package:quiz_app/controllerquestion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text("Quiz Application"),
          backgroundColor: Colors.indigoAccent,
        ),
        body: QuizApp(),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  ControllerQuestion cq = new ControllerQuestion();

  List<Widget> scoreKeper = [];

  void checkAnswer(bool response) {
    setState(() {
      if (cq.isfinished() == true) {
        scoreKeper.clear();
        cq.reset();
        //dialog
      } else {
        if (response == cq.getanswer()) {
          scoreKeper.add(Icon(Icons.check, color: Colors.white));
        } else {
          scoreKeper.add(Icon(Icons.close, color: Colors.red));
        }
        cq.nextquestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                cq.getquestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
              child: FlatButton(
            onPressed: () {
              checkAnswer(true);
            },
            child: Text(
              "True",
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            color: Colors.orange,
          )),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                "False",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: Colors.red,
            ),
          ),
          Row(
            children: scoreKeper,
          )
        ],
      ),
    );
  }
}
