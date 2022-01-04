import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/app_bar.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/button_of_view_courses.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/head_card_of_text.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/the_bottom_bar_of_youtube.dart';
import 'package:gammal_tech_mobile_app/Providers/get_personal_data.dart';
import 'package:gammal_tech_mobile_app/pages/waitingPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lesson_page.dart';

class videoPage extends StatelessWidget {
  int index;
  SharedPreferences prefs;
  videoPage(this.index, this.prefs, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildContainer(context),
    );
  }

  Column buildContainer(context) {
    var provider = Provider.of<ProviderGetPersonalData>(context);
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: 700,
            color: const Color.fromARGB(215, 11, 108, 108),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    headCardOfText(titles[index]),
                    buildTheLessonVideo(true, false, provider.videoId),
                    const SizedBox(
                      height: 10,
                    ),
                    buildTextButtonOfViewCourses("Start Coding", context, null),
                    buildContainerOfExercises(context),
                    buildContainerOfQuestion(context),
                    buildEmptyContainer(),
                    buildTheBottomContainer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container buildEmptyContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      width: double.infinity,
      height: 700,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
    );
  }

  Container buildContainerOfQuestion(context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: Column(
        children: [
          buildTheHeadText("Questions"),
          buildSizedBox(),
          const Text(
            "Answer the following questions according to what you learned from the video.",
            textAlign: TextAlign.center,
          ),
          buildSizedBox(),
          Container(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                buildQuestions(0, context),
                buildDropDwonPadding(context),
                buildQuestions(1, context),
                buildDropDwonPadding(context),
                buildQuestions(2, context),
                buildDropDwonPadding(context),
                buildQuestions(3, context),
                buildDropDwonPadding(context),
                buildSendButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildDropDwonPadding(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          height: 40,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(191, 243, 243, 243),
              border: Border.all(color: Colors.black12)),
          child: buildDropdownButton(context)),
    );
  }

  DropdownButtonHideUnderline buildDropdownButton(context) {
    var plus = Provider.of<ProviderGetPersonalData>(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: plus.dropdownValue1,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        iconSize: 20,
        elevation: 16,
        style: const TextStyle(
            color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w300),
        onChanged: (n) {
          plus.onChange(n);
        },
        items: ["Select one...", 'Hello Gammal Tech', 'Error']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Directionality buildContainerOfExercises(context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            buildTheHeadText("Exercises"),
            buildSizedBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextExercises(0, context),
                buildTextExercises(1, context),
                buildTextExercises(2, context),
                buildTextExercises(3, context),
                buildTextExercises(4, context),
                buildTextExercises(5, context),
                buildTextExercises(6, context),
                buildTextExercises(7, context),
                buildTextExercises(8, context),
                buildTextExercises(9, context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildTextExercises(int index, context) {
    var plus = Provider.of<ProviderGetPersonalData>(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            "${index + 1}.  ${index == 0 ? plus.exercises[index]["exercise"] : plus.exercises[index]}",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            maxLines: 4,
            textAlign: TextAlign.right,
          ),
        ),
        if (index == 0)
          InkWell(
            onTap: () {
              launchURL(plus.exercises[index]["url"]);
            },
            child: const Text(
              "Solution",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color.fromRGBO(0, 78, 234, 1.0),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
      ],
    );
  }

  Center buildTheHeadText(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
      ),
    );
  }

  Card buildSendButton(context) {
    var plus = Provider.of<ProviderGetPersonalData>(context);
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => waitingPage(
                          checkAccount: true,
                          image: plus.dropdownValue1 == "Hello Gammal Tech"
                              ? "asset/images/right.gif"
                              : "asset/images/wrong.gif",
                          checkAnswer:
                              plus.dropdownValue1 == "Hello Gammal Tech"
                                  ? true
                                  : false,
                        )));
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

  Text buildQuestions(int index, context) {
    var plus = Provider.of<ProviderGetPersonalData>(context);
    return Text(
      "${plus.questions[index]["question"]}",
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        child: Text(item),
      );

  SizedBox buildSizedBox() => const SizedBox(height: 15);
}
