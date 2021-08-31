import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/CPP_programming_page.dart';
import 'package:gammal_tech_mobile_app/c_programming_page.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/get_the_video.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
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
                buildVideo("https://firebasestorage.googleapis.com/v0/b/gammal-tech-mobile-app.appspot.com/o/Gammal%20Tech%20-%20C.mp4?alt=media&token=31ca2d8d-236f-42dc-874b-a5c3c01486d7"),
                buildCardText(text: "C Programming", page: cProgrammingPage()),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/gammal-tech-mobile-app.appspot.com/o/Gammal%20Tech%20-%20C%2B%2B.mp4?alt=media&token=42d826fc-89a2-4d84-badd-9f3d832e1219"),
                buildCardText(text: "C++ Programming", page: CppProgrammingPage()),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/gammal-tech-mobile-app.appspot.com/o/Gammal%20Tech%20-%20Data%20Structures.mp4?alt=media&token=47babd95-e5fe-4716-9732-bee416a44990"),
                buildCardText(text: "Data Structures"),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/gammal-tech-mobile-app.appspot.com/o/Gammal%20Tech%20-%20Algorithms.mp4?alt=media&token=1ddc81d9-ddf6-4cda-ac34-de6e39236b25"),
                buildCardText(text: "Algorithms"),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/gammal-tech-mobile-app.appspot.com/o/Gammal%20Tech%20-%20OOP.mp4?alt=media&token=281210a6-c4d7-4673-b2a1-857498d248bc"),
                buildCardText(text: "OOP"),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/gammal-tech-mobile-app.appspot.com/o/Gammal%20Tech%20-%20Python.mp4?alt=media&token=0c3dca71-ebd8-429b-836d-f3feed7af04a"),
                buildCardText(text: "Python"),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/gammal-tech-mobile-app.appspot.com/o/Gammal%20Tech%20-%20Entrepreneurship.mp4?alt=media&token=21190dc6-d0f5-4989-a246-a13f0a8b28b8"),
                buildCardText(text: "Entrepreneurship"),
                buildSizedBox(),
                buildVideo("https://firebasestorage.googleapis.com/v0/b/gammal-tech-mobile-app.appspot.com/o/Gammal%20Tech%20-%20Company%20Security.mp4?alt=media&token=9f73a523-9fcc-40bf-a114-3da08be8fe9f"),
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
