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

}
