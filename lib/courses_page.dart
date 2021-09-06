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

  Container buildContainer(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    return Container(
          width: double.infinity,
          height: 700,
          color: Color.fromARGB(215, 0, 118, 125),
          child: buildSingleChildScrollView(docs),
        );
  }

  SingleChildScrollView buildSingleChildScrollView(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TheHeadCardOfText("Our Courses"),
                buildTheVideo(docs[0].data()),
                buildCardText(text: "C Programming", page: cProgrammingPage("C Programming")),
                buildSizedBox(),
                buildTheVideo(docs[1].data()),
                buildCardText(text: "C++ Programming", page: cProgrammingPage("C++ Programming")),
                buildSizedBox(),
                buildTheVideo(docs[2].data()),
                buildCardText(text: "Data Structures"),
                buildSizedBox(),
                buildTheVideo(docs[3].data()),
                buildCardText(text: "Algorithms"),
                buildSizedBox(),
                buildTheVideo(docs[0].data()),
                buildCardText(text: "OOP"),
                buildSizedBox(),
                buildTheVideo(docs[3].data()),
                buildCardText(text: "Python"),
                buildSizedBox(),
                buildTheVideo(docs[1].data()),
                buildCardText(text: "Entrepreneurship"),
                buildSizedBox(),
                buildTheVideo(docs[2].data()),
                buildCardText(text: "Company Security"),
                buildSizedBox(),
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
