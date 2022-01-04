import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/app_bar.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/head_card_of_text.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/the_bottom_bar_of_youtube.dart';
import 'package:gammal_tech_mobile_app/Providers/send_email.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_page.dart';

class ContactUs extends StatelessWidget {
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
        color: const Color.fromARGB(215, 11, 108, 108),
        child: container(context),
      ),
    );
  }

  SingleChildScrollView container(var context) {
    var plus = Provider.of<Provider_SendEmail>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          containerOfTheHeadOfTheList(),
          Card(
            margin: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                children: [
                  buildQuestionText('Name', 24.5),
                  buildTextFormField(plus.controlUserName, 'Your Name'),
                  buildQuestionText('Phone Number', 24.5),
                  buildTextFormField(plus.controlPhoneNumber, '+20100XXXYYYY'),
                  buildQuestionText('Email Address', 24.5),
                  buildTextFormField(
                      plus.controlEmailAddress, 'Your@gmail.com'),
                  buildQuestionText('Message', 24.5),
                  buildTextFormField(
                      plus.controlMessage, 'Your message goes here'),
                  attachFileButton(context),
                  sendTextButton(context),
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

  Card sendTextButton(context) {
    var plus = Provider.of<Provider_SendEmail>(context);

    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: const Color.fromARGB(215, 0, 118, 125),
            borderRadius: BorderRadius.circular(5)),
        child: TextButton(
          onPressed: () async {
            plus.send(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: const Text(
            "  Send  ",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Padding attachFileButton(context) {
    var plus = Provider.of<Provider_SendEmail>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          for (var i = 0; i < plus.attachments.length; i++)
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    plus.attachments[i],
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () => {plus.removeAttachment(i)},
                )
              ],
            ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.attach_file),
              onPressed: plus.openImagePicker,
            ),
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
          height: 45,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              border: Border.all(color: Colors.black26)),
          child: TextFormField(
            maxLines: null,
            expands: false,
            controller: controller,
            keyboardType: TextInputType.name,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.black26),
            ),
          ),
        ),
      ),
    );
  }

  Column containerOfTheHeadOfTheList() {
    return Column(
      children: [
        headCardOfText(title),
        const SizedBox(height: 10),
        descriptionText(),
        const SizedBox(height: 10),
      ],
    );
  }

  Card descriptionText() {
    return Card(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              "Call us or use WhatsApp at",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            InkWell(
                onTap: () => launch("tel:+201033998844"),
                child: Text(
                  "+201033998844",
                  style: TextStyle(fontSize: 20, color: Colors.blue[700]),
                )),
            const Text(
              "Email us at support@gammal.tech\nChat with us using the chat icon (for signed-in users)."
              "Send us a message using the form.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
