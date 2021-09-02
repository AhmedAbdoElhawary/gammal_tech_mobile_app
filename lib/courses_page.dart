import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/CPP_programming_page.dart';
import 'package:gammal_tech_mobile_app/c_programming_page.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/get_the_video.dart';
import 'package:video_player/video_player.dart';

class CoursesPage extends StatefulWidget {
  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("info").snapshots(),
        builder: (BuildContext context,
        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          final docs = snapshot.data!.docs;
          return Container(
            width: double.infinity,
            height: 700,
            color: Color.fromARGB(215, 1, 82, 69),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Card(
                      margin: EdgeInsets.all(10),
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
                            "Our Courses",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    buildVideo(docs[0]),
                    buildCardText(text: "C Programming", page: cProgrammingPage()),
                    buildSizedBox(),
                    buildVideo(docs[1]),
                    buildCardText(text: "C++ Programming", page: CppProgrammingPage()),
                    buildSizedBox(),
                    buildVideo(docs[0]),
                    buildCardText(text: "Data Structures"),
                    buildSizedBox(),
                    buildVideo(docs[1]),
                    buildCardText(text: "Algorithms"),
                    buildSizedBox(),
                    buildVideo(docs[0]),
                    buildCardText(text: "OOP"),
                    buildSizedBox(),
                    buildVideo(docs[1]),
                    buildCardText(text: "Python"),
                    buildSizedBox(),
                    buildVideo(docs[0]),
                    buildCardText(text: "Entrepreneurship"),
                    buildSizedBox(),
                    buildVideo(docs[1]),
                    buildCardText(text: "Company Security"),
                    buildSizedBox(),
                  ],
                ),
              ),
            ),
          );
        }
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

  Padding buildVideo(url) {
    var taskData = url.data();
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        height: 190,
        alignment: Alignment.center,
        child: ChewieListItem(
          videoPlayerController: VideoPlayerController.network(taskData["videoUrl"]),
          looping: true,
        ),
      ),
    );
  }
}
