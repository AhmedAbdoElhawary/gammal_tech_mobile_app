import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/courses_page.dart';
import 'package:gammal_tech_mobile_app/get_the_video.dart';
import 'package:gammal_tech_mobile_app/my_account_page.dart';
import 'package:video_player/video_player.dart';

AppBar buildAppBar(context) {
  return AppBar(
    elevation: 5,
    title: TextButton(
      onPressed: () {},
      child: Text(
        "Gammal Tech",
        style: TextStyle(color: Colors.teal[800], fontSize: 30),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          showGeneralDialog(
            context: context,
            barrierDismissible: true,
            transitionDuration: Duration(milliseconds: 500),
            barrierLabel: MaterialLocalizations.of(context).dialogLabel,
            barrierColor: Colors.black.withOpacity(0.5),
            pageBuilder: (context, _, __) {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromARGB(0, 255, 255, 255),
                      child: Card(
                        color: Color.fromARGB(240, 255, 255, 255),
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            ListTile(title: Text('Premium')),
                            ListTile(
                                title: Text('Courses'),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CoursesPage()));
                                }),
                            ListTile(title: Text('Masterclass')),
                            ListTile(title: Text('FAQ')),
                            ListTile(title: Text('Content')),
                            Center(
                              child: Card(
                                color: Color.fromARGB(255, 0, 118, 125),
                                margin: EdgeInsets.all(10),
                                elevation: 5,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                myAccountPage()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "  MY Account  ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ).drive(Tween<Offset>(
                  begin: Offset(0, -1.0),
                  end: Offset.zero,
                )),
                child: child,
              );
            },
          );
        },
        icon: Icon(
          Icons.menu,
          textDirection: TextDirection.rtl,
          color: Colors.black87,
        ),
      ),
    ],
  );
}

Card buildTextButton(String text, page, context) {
  return Card(
    elevation: 5,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      height: 55,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
    ),
  );
}

Padding buildTheVideo(Map<String, dynamic> taskData) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
    child: Container(
      color: Colors.white,
      width: double.infinity,
      height: 186,
      child: ChewieListItem(
        videoPlayerController:
            VideoPlayerController.network(taskData["videoUrl"]),
        looping: true,
      ),
    ),
  );
}

Card TheHeadCardOfText(String title) {
  return Card(
    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
    elevation: 5,
    color: Colors.black,
    child: Container(
      height: 47,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
