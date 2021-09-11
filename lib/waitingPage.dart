import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class waitingPage extends StatefulWidget {
  var image;
  var checkAnswer;
  waitingPage({var image, var checkAnswer}) {
    this.image = image;
    this.checkAnswer = checkAnswer;
  }
  @override
  State<waitingPage> createState() =>
      _waitingPageState(image: image, checkAnswer: checkAnswer);
}

class _waitingPageState extends State<waitingPage> {
  var image = null;
  var checkAnswer;
  _waitingPageState({var image, var checkAnswer}) {
    this.image = image;
    this.checkAnswer = checkAnswer;
  }
  int _start = 5;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(215, 11, 108, 108),
        child: Center(
            child: Column(
          children: [
            if (image != null) Expanded(flex: 6, child: Image.network(image)),
            Expanded(flex: 1, child: Center(child: Text("$_start"))),
          ],
        )),
      ),
    );
  }
}
