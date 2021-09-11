import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';

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

      ),
    );
  }
}
