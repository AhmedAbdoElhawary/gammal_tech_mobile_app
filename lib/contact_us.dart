import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/home_page.dart';
import 'package:gammal_tech_mobile_app/video_page.dart';
import 'package:gammal_tech_mobile_app/waitingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUS extends StatelessWidget {
  TextEditingController controlUserName = TextEditingController();
  TextEditingController controlPhoneNumber = TextEditingController();
  TextEditingController controlEmailAddress = TextEditingController();
  TextEditingController controlMessage = TextEditingController();

  String title = "C Programming";
  cProgrammingPage({var title}) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        width: double.infinity,
        height: 700,
        color: Color.fromARGB(215, 11, 108, 108),
        child: container(context),
      ),
    );
  }

  SingleChildScrollView container(var context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            elevation: 5,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                children: [
                  buildQuestionText('Name', 24.5),
                  buildTextFormField(controlUserName, 'Your Name'),
                  buildQuestionText('Phone Number', 24.5),
                  buildTextFormField(controlPhoneNumber, '+20100XXXYYYY'),
                  buildQuestionText('Email Address', 24.5),
                  buildTextFormField(controlEmailAddress, 'Your@gmail.com'),
                  buildQuestionText('Message', 24.5),
                  buildTextFormField(controlMessage, 'Your message goes here'),
                  Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(215, 0, 118, 125),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text(
                          "  Send  ",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: buildTheBottomContainer(),
          ),
        ],
      ),
    );
  }

  Text buildQuestionText(String text, double fontSize) => Text(
        text,
        style: TextStyle(
            fontWeight: fontSize != 25 ? FontWeight.normal : FontWeight.bold,
            color: Colors.black,
            fontSize: fontSize),
      );

  Padding buildTextFormField(var controller, String hint) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 5,
        bottom: 15,
      ),
      child: Card(
        elevation: 0,
        child: Container(
          height: 40,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              border: Border.all(color: Colors.black26)),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.name,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black26),
            ),
          ),
        ),
      ),
    );
  }

}
