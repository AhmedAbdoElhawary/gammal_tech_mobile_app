import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/video_page.dart';

class CppProgrammingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        width: double.infinity,
        height: 700,
        color: Color.fromARGB(215, 1, 82, 69),
        child: ListView(
          children: [
            Card(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              elevation: 5,
              color: Colors.black,
              child: TextButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => CoursesPage()));
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "C++ Programming",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              elevation: 5,
              child: TextButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => CoursesPage()));
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Your first step in computer science and becoming a software engineer.\nDevelop your programming skills by learning C: one of the most fundamental programming languages.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildPadding(),
            buildCard(context),
            buildPadding(),
            buildCard(context),
            buildPadding(),
            buildCard(context),
            buildPadding(),
            buildCard(context),
            buildPadding(),
            buildCard(context),
          ],
        ),
      ),
    );
  }

  Card buildCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 15, right: 15, top: 5),
      elevation: 5,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => videoPage()));
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                "printf",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "the first lesson",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 33,
          width: double.infinity,
          child: Center(
              child: Text(
                "Lesson 1",
                style: TextStyle(color: Colors.white, fontSize: 23),
              )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromARGB(200, 8, 43, 34),
          ),
        ),
      ),
    );
  }
}
