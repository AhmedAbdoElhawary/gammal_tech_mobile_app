import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gammal_tech_mobile_app/the_pages/lesson_page.dart';
import 'package:gammal_tech_mobile_app/the_pages/sign_in_page.dart';

class waitingPage extends StatefulWidget {
  var image;
  bool checkAnswer;
  bool checkAccount;
  waitingPage(
      {required this.image,
      required this.checkAnswer,
      required this.checkAccount});
  @override
  State<waitingPage> createState() => _waitingPageState();
}

class _waitingPageState extends State<waitingPage> {
  int _start = 5;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(215, 11, 108, 108),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.image != null)
              Column(
                children: [
                  Image.asset(widget.image),
                  buildText(widget.checkAnswer
                      ? "Correct Answer ! "
                      : "Wrong Answer"),
                ],
              ),
            if (!widget.checkAccount) buildText("Sign in first"),
            SizedBox(
              height: 10,
            ),
            Center(
              child: buildText("$_start"),
            ),
          ],
        )),
      ),
    );
  }

  Text buildText(String text) =>
      Text(text, style: TextStyle(color: Colors.white, fontSize: 18));
  Future<void> startTimer() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (_start <= 0) {
        if (widget.checkAccount) {
          if (widget.checkAnswer)
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => lessonPage('C Programming')));
          else if (!widget.checkAnswer) Navigator.pop(context);
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => signInPage()));
        }
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          WidgetsBinding.instance!.addPostFrameCallback((_) {});
          setState(() {
            _start--;
          });
        });
      }
    });
  }
}
