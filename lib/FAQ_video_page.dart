import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/courses_page.dart';
import 'package:url_launcher/url_launcher.dart';

class faqVideoPage extends StatefulWidget {
  String index;
  faqVideoPage(this.index);
  @override
  State<faqVideoPage> createState() => _faqVideoPageState(index);
}

class _faqVideoPageState extends State<faqVideoPage> {
  String textIndex;

  _faqVideoPageState(this.textIndex);

  void initState() {
    super.initState();
  }

  @override
  int get hashCode => super.hashCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: new StreamBuilder(
        stream: FirebaseFirestore.instance.collection("info").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final docs = snapshot.data!.docs;
          var taskData = docs[0].data();

          return buildContainer(taskData, context);
        },
      ),
    );
  }

  Column buildContainer(
      Map<String, dynamic> taskData, BuildContext context) {
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
                  buildTheVideo(taskData),
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
