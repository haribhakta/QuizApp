import 'package:quiz_app/modelquestions.dart';

class ControllerQuestion {
  int _qn = 0;
  List<ModelQuestions> _questions = [
    ModelQuestions("Flutter is developed by Google.", true),
    ModelQuestions("Flutter is a type of programming language.", false),
    ModelQuestions("Dart is type of framework.", false),
    ModelQuestions("Flutter isnot written by using Dart Language.", false),
    ModelQuestions(
        "Flutter is helped to develop web, mobile and desktop apps.", true),
  ];

  String getquestion() {
    return _questions[_qn].questiontext;
  }

  bool getanswer() {
    return _questions[_qn].answertext;
  }

  void reset() {
    _qn = 0;
  }

  void nextquestion() {
    if (_qn < _questions.length) {
      _qn++;
    }
  }

  bool isfinished() {
    if (_qn < _questions.length + 1) {
      return false;
    } else {
      return true;
    }
  }
}
