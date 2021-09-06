import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/courses_page.dart';

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

          return Container(
            width: double.infinity,
            height: 700,
            color: Color.fromARGB(215, 0, 118, 125),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    elevation: 5,
                    color: Colors.black,
                    child: Container(
                      height: 47,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        textIndex,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  buildTheVideo(taskData),
                  Directionality(
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
                  ),
                  buildStartCodingTextButton(
                      "  View Courses  ", CoursesPage(), context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox buildSizedBox() => SizedBox(height: 15);

  Text buildTextQuestion() => Text(
        "إذا واجهتك مشكلة آثناء إستخدام الموقع برجاء الإتصال بنا في أقرب وقت"
        "\n"
        "\n"
        "أوقات العمل الرسمية من الأحد إلي الخميس من الساعة التاسعة صباحا وحتي الخامسة مساءا بتوقيت القاهرة"
        "\n"
        "\n"
        "\n"
        "رقم التليفون والواتساب"
        "\n"
        "+201033998844",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      );
}
