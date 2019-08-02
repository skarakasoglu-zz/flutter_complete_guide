import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onClicked;
  final String answerText;

  Answer(this.onClicked, this.answerText);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      child: Text(answerText),
      onPressed: onClicked,
    );
  }
}
