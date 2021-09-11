import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/c_programming_page.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';

class CoursesPage extends StatefulWidget {
  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("info").snapshots(),
        builder: (BuildContext context,
        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          final docs = snapshot.data!.docs;
          return buildContainer(docs);
        }
      ),
    );
  }

  Column buildContainer(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    return Column(
      children: [
        Expanded(
          child: Container(
                width: double.infinity,
                height: 700,
            color: Color.fromARGB(215, 11, 108, 108),
                child: buildSingleChildScrollView(docs),
              ),
        ),
      ],
    );
  }

  SingleChildScrollView buildSingleChildScrollView(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    var video=docs[0].data();
    return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TheHeadCardOfText("Our Courses"),
                buildTheVideo(video),
                buildCardText(text: "C Programming", page: cProgrammingPage(title:"C Programming")),
                buildSizedBox(),
                buildTheVideo(video),
                buildCardText(text: "C++ Programming", page: cProgrammingPage(title:"C++ Programming")),
                buildSizedBox(),
                buildTheVideo(video),
                buildCardText(text: "Data Structures"),
                buildSizedBox(),
                buildTheVideo(video),
                buildCardText(text: "Algorithms"),
                buildSizedBox(),
                buildTheVideo(video),
                buildCardText(text: "OOP"),
                buildSizedBox(),
                buildTheVideo(video),
                buildCardText(text: "Python"),
                buildSizedBox(),
                buildTheVideo(video),
                buildCardText(text: "Entrepreneurship"),
                buildSizedBox(),
                buildTheVideo(video),
                buildCardText(text: "Company Security"),
                buildSizedBox(),
                buildTheBottomContainer(),
              ],
            ),
          ),
        );
  }

  SizedBox buildSizedBox() => SizedBox(height: 10);

  Card buildCardText({required String text, var page}) {
    return Card(
      margin: EdgeInsets.only(left: 15, right: 15, top: 5),
      elevation: 5,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
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
