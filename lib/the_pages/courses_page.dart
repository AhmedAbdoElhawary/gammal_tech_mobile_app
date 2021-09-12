import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-theBottomBarOfyoutube.dart';
import 'package:gammal_tech_mobile_app/the_pages/lesson_page.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/common_ui/common_appbar.dart';

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildContainer(context),
    );
  }

  Column buildContainer(context) {
    return Column(
      children: [
        Expanded(
          child: Container(
                width: double.infinity,
                height: 700,
            color: Color.fromARGB(215, 11, 108, 108),
                child: buildSingleChildScrollView(context),
              ),
        ),
      ],
    );
  }

  SingleChildScrollView buildSingleChildScrollView(context) {
    return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TheHeadCardOfText("Our Courses"),
                buildTheVideo(false,false),
                buildCardText(text: "C Programming", page: lessonPage("C Programming"),context:context),
                buildSizedBox(),
                buildTheVideo(false,false),
                buildCardText(text: "C++ Programming", page: lessonPage("C++ Programming"),context:context),
                buildSizedBox(),
                buildTheVideo(false,false),
                buildCardText(text: "Data Structures",context:context),
                buildSizedBox(),
                buildTheVideo(false,false),
                buildCardText(text: "Algorithms",context:context),
                buildSizedBox(),
                buildTheVideo(false,false),
                buildCardText(text: "OOP",context:context),
                buildSizedBox(),
                buildTheVideo(false,false),
                buildCardText(text: "Python",context:context),
                buildSizedBox(),
                buildTheVideo(false,false),
                buildCardText(text: "Entrepreneurship",context:context),
                buildSizedBox(),
                buildTheVideo(false,false),
                buildCardText(text: "Company Security",context:context),
                buildSizedBox(),
                buildTheBottomContainer(),
              ],
            ),
          ),
        );
  }

  SizedBox buildSizedBox() => SizedBox(height: 10);

  Card buildCardText({required BuildContext context ,required String text, var page}) {
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
