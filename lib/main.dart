import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questions = [
    {
      'questionText': "What's your favourite colour?",
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Black', 'score': 1},
      ]
    },
    {
      'questionText': "What's your favourite animal?",
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Bird', 'score': 5},
        {'text': 'Cat', 'score': 3},
        {'text': 'Lion', 'score': 1},
      ]
    },
    {
      'questionText': "What's your favourite footbal player in Liverpool?",
      'answers': [
        {'text': "Mo Salah", 'score': 7},
        {'text': "Roberto Firmino", 'score': 5},
        {'text': "Sadio Mane", 'score': 3},
        {'text': "Virgil Van Dijk", 'score': 10},
      ]
    }
  ];
  var _questionIndex = 0;
  var _finalScore = 0;

  void _questionAnswered(int score) {
    print('Answer chosen!');
    setState(() {
      _questionIndex++;
      _finalScore += score;
    });
    if (_questionIndex < questions.length) {
      print('We have more questions.');
    } else {
      print('We have no more questions.');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _finalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("First Application"),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questionAnswered: _questionAnswered,
                questionIndex: _questionIndex,
                questions: questions,
              )
            : Center(
                child: Result(_finalScore, _resetQuiz),
              ),
      ),
    );
  }
}
