import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-theBottomBarOfyoutube.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/common_ui/common_appbar.dart';
import 'package:gammal_tech_mobile_app/the_pages/courses_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class faqVideoPage extends StatelessWidget {
  String textIndex;
  SharedPreferences prefs;
  faqVideoPage(this.textIndex,this.prefs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildContainer( context),
    );
  }

  Column buildContainer(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            color: Color.fromARGB(215, 11, 108, 108),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TheHeadCardOfText(textIndex),
                  buildTheVideo(true,false),
                  buildContainerOfText(),
                  buildTextButton("  View Courses  ", CoursesPage(), context),
                ],
              ),
            ),
          ),
        ),
        buildTheBottomContainer(),
      ],
    );
  }

  Directionality buildContainerOfText() {
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
        child: Container(
          alignment: Alignment.center,
          child: buildTextQuestion(),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => SizedBox(height: 15);

  Directionality buildTextQuestion() => Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            Text(
              "إذا واجهتك مشكلة آثناء إستخدام الموقع برجاء الإتصال بنا في أقرب وقت"
              "\n"
              "\n"
              "أوقات العمل الرسمية من الأحد إلي الخميس من الساعة التاسعة صباحا وحتي الخامسة مساءا بتوقيت القاهرة"
              "\n"
              "\n"
              "\n"
              "رقم التليفون والواتساب",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: ()=>launch("tel:+201033998844"),
                child: Text(
              "+201033998844",
              style: TextStyle(color: Colors.blue[700]),
            )),
          ],
        ),
      );
}
