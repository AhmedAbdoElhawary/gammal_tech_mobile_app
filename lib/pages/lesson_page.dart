import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/app_bar.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/head_card_of_text.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/the_bottom_bar_of_youtube.dart';
import 'package:gammal_tech_mobile_app/Providers/get_personal_data.dart';
import 'package:gammal_tech_mobile_app/Providers/get_videos_form_firestore.dart';
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

Map map = {
  "C Programming": "c",
  "C++ Programming": "cpp",
  "Data Structures": "ds",
  "Algorithms": "algo",
  "OOP": "oop",
  "Python": "python",
  "Entrepreneurship": "entrepreneurship",
  "Company Security": "CompanySecurity",
};

class LessonPage extends StatelessWidget {
  String title = "C Programming";
  LessonPage(this.title);
  @override
  Widget build(BuildContext context) {
    String textPath = map[title];
    var provider = Provider.of<ProviderGetPersonalData>(context);
    provider.getLengthOfTheCourse(textPath);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        width: double.infinity,
        height: 700,
        color: const Color.fromARGB(215, 11, 108, 108),
        child: ListView.separated(
            itemCount: provider.lengthOfTheCourse,
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
    var provider = Provider.of<ProviderGetPersonalData>(context);
    provider.getVideoLessonsData("c", index);
    return Column(
      children: [
        if (index == 0) containerOfTheHeadOfTheList(),
        buildPadding(index),
        buildCard(
            context, provider.lessonName, provider.descriptionText, index),
        if (titles.length - 1 == index)
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: buildTheBottomContainer(),
          ),
      ],
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
      child: TextButton(
        onPressed: () {},
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: const Text(
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

  Card buildCard(
      BuildContext context, String title, String descriptionText, int index) {
    var plus = Provider.of<Provider_GetTheVideosFromFirestore>(context);
    return Card(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
      elevation: 5,
      child: TextButton(
        onPressed: () async {
          var provider =
              Provider.of<ProviderGetPersonalData>(context, listen: false);
          provider.getVideoLessonsData("c", index);
          plus.onPressedLessonButton(context, index);
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: [
              buildText(title, 25, FontWeight.bold),
              buildText(descriptionText, 15, FontWeight.w300),
            ],
          ),
        ),
      ),
    );
  }

  Text buildText(String title, double size, weight) => Text(
        title,
        style:
            TextStyle(fontSize: size, color: Colors.black, fontWeight: weight),
      );

  Padding buildPadding(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 33,
          width: double.infinity,
          child: Center(
              child: Text(
            "Lesson ${index + 1}",
            style: const TextStyle(color: Colors.white, fontSize: 23),
          )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(200, 8, 43, 34),
          ),
        ),
      ),
    );
  }
}
