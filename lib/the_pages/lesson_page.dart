import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-theBottomBarOfyoutube.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/common_ui/common_appbar.dart';
import 'package:gammal_tech_mobile_app/provider_classes/provider_get_videos_form_firestore.dart';
import 'package:provider/provider.dart';

final titles = [
  'printf',
  'Variables',
  'scanf',
  'practice 1',
  'practice 2',
  'practice 3',
  'practice 4',
  'practice 5',
  'practice 6',
  'practice 7',
  'practice 8',
  'practice 9',
  'practice 10'
];

class lessonPage extends StatelessWidget {
  String title = "C Programming";
  lessonPage(var title) {
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
        child: ListView.separated(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return container(index, context);
            },
            separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 5,
                )),
      ),
    );
  }

  Column container(int index, var context) {
    return Column(
      children: [
        if (index == 0) containerOfTheHeadOfTheList(),
        buildPadding(index),
        buildCard(context, titles[index], index),
        if (titles.length - 1 == index) Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: buildTheBottomContainer(),
        ),
      ],
    );
  }

  Column containerOfTheHeadOfTheList() {
    return Column(
      children: [
        TheHeadCardOfText(title),
        SizedBox(height: 10),
        descriptionText(),
        SizedBox(height: 10),
      ],
    );
  }

  Card descriptionText() {
    return Card(
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      elevation: 5,
      child: TextButton(
        onPressed: () {},
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            "Your first step in computer science and becoming a software engineer.\nDevelop your programming skills by learning C: one of the most fundamental programming languages.",
            textAlign: TextAlign.center,

            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }

  Card buildCard(BuildContext context, String title, int index) {
    var plus = Provider.of<Provider_GetTheVideosFromFirestore>(context);
    return Card(
      margin: EdgeInsets.only(left: 15, right: 15, top: 5),
      elevation: 5,
      child: TextButton(
        onPressed: () async{
          plus.onPressedLessonButton(context, index);
          },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                title,
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

  Padding buildPadding(int index) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 33,
          width: double.infinity,
          child: Center(
              child: Text(
            "Lesson ${index + 1}",
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
