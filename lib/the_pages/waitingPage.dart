import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/the_pages/lesson_page.dart';

class waitingPage extends StatefulWidget {
  var image;
  bool checkAnswer;
  bool checkAccount;
  waitingPage({required this.image, required this.checkAnswer,required this.checkAccount});
  @override
  State<waitingPage> createState() =>
      _waitingPageState(image: image, checkAnswer: checkAnswer,checkAccount:checkAccount );
}

class _waitingPageState extends State<waitingPage> {
  var image;
  bool checkAnswer;
  bool checkAccount;
  _waitingPageState({required this.image, required this.checkAnswer,required this.checkAccount});
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
          children: [
            if (image != null) Expanded(flex: 6, child: Image.asset(image)),
            Expanded(flex: 1, child: Center(child: Text("$_start"))),
          ],
        )),
      ),
    );
  }
  Future<void> startTimer() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (_start <= 0) {
        if(checkAnswer)
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => lessonPage('C Programming')));
        else if(!checkAccount||!checkAnswer)
          Navigator.pop(context);
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          WidgetsBinding.instance!.addPostFrameCallback((_){
          });
          setState(() {
            _start--;
          });
        });
      }
    });
  }
}
