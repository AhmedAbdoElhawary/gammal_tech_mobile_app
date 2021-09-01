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
      body: Container(
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
                buildVideo("https://firebasestorage.googleapis.com/v0/b/ai-interns-37af4.appspot.com/o/Gammal%20Tech%20-%20C.mp4?alt=media&token=c9c86cfd-a351-4c61-a6e2-5bdbe2ba5f6c"),
                buildCardText(text: "C Programming", page: cProgrammingPage()),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/ai-interns-37af4.appspot.com/o/Gammal%20Tech%20-%20C.mp4?alt=media&token=c9c86cfd-a351-4c61-a6e2-5bdbe2ba5f6c"),
                buildCardText(text: "C++ Programming", page: CppProgrammingPage()),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/ai-interns-37af4.appspot.com/o/Gammal%20Tech%20-%20C.mp4?alt=media&token=c9c86cfd-a351-4c61-a6e2-5bdbe2ba5f6c"),
                buildCardText(text: "Data Structures"),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/ai-interns-37af4.appspot.com/o/Gammal%20Tech%20-%20C.mp4?alt=media&token=c9c86cfd-a351-4c61-a6e2-5bdbe2ba5f6c"),
                buildCardText(text: "Algorithms"),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/ai-interns-37af4.appspot.com/o/Gammal%20Tech%20-%20C.mp4?alt=media&token=c9c86cfd-a351-4c61-a6e2-5bdbe2ba5f6c"),
                buildCardText(text: "OOP"),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/ai-interns-37af4.appspot.com/o/Gammal%20Tech%20-%20C.mp4?alt=media&token=c9c86cfd-a351-4c61-a6e2-5bdbe2ba5f6c"),
                buildCardText(text: "Python"),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/ai-interns-37af4.appspot.com/o/Gammal%20Tech%20-%20C.mp4?alt=media&token=c9c86cfd-a351-4c61-a6e2-5bdbe2ba5f6c"),
                buildCardText(text: "Entrepreneurship"),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/ai-interns-37af4.appspot.com/o/Gammal%20Tech%20-%20C.mp4?alt=media&token=c9c86cfd-a351-4c61-a6e2-5bdbe2ba5f6c"),
                buildCardText(text: "Company Security"),
                buildSizedBox(),
              ],
            ),
          ),
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

  Padding buildVideo(String url) {
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
          videoPlayerController: VideoPlayerController.network(url),
          looping: true,
        ),
      ),
    );
  }
}
