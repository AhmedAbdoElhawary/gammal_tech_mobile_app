import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/courses_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildCenterBody(context),
    );
  }

  Center buildCenterBody(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        color: Color.fromARGB(215, 1, 82, 69),
        child: buildColumn(context),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildText(),
        buildCardStartHere(),
        buildCard(context, "Courses"),
        buildCard(context, "FAQ"),
        buildCardGoPremium(),
        buildRowText("Facebook"),
        buildRowText("YouTube"),
      ],
    );
  }

  Row buildRowText(String link) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildJoinUsText(),
        buildLink(link),
        buildExclamationMarkAsAText(),
      ],
    );
  }

  InkWell buildLink(String link) {
    return InkWell(
      onTap: () {},
      child: Text(
        link,
        style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 15,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Text buildExclamationMarkAsAText() {
    return Text(
      "!",
      style: TextStyle(
          color: Colors.white70,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300),
    );
  }

  Text buildJoinUsText() {
    return Text(
      "Join us on ",
      style: TextStyle(
          color: Colors.white70,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300),
    );
  }

  Card buildCardGoPremium() {
    return Card(
      color: Colors.yellow[600],
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: TextButton(
        onPressed: () {},
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            "Go Premium",
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Card buildCardStartHere() {
    return Card(
      color: Color.fromARGB(200, 8, 43, 34),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: TextButton(
        onPressed: () {},
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            "START HERE",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }

  Text buildText() {
    return Text(
      "The only place to master software engineering.",
      style: TextStyle(
        color: Colors.white70,
        fontStyle: FontStyle.italic,
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
      maxLines: 2,
    );
  }

  Card buildCard(BuildContext context, String text) {
    return Card(
      margin: EdgeInsets.only(left: 15, right: 15, top: 5),
      elevation: 10,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CoursesPage()));
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
