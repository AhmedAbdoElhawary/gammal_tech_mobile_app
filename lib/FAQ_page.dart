import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/FAQ_video_page.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';

final titles = [
  "هل يمكن العمل بدون شهادة",
  "Gammal Tech العمل في",
  'من أين أبدأ تعلم البرمجة؟',
  "هل يمكن العمل بدون شهادة",
  "Gammal Tech العمل في",
  'من أين أبدأ تعلم البرمجة؟',
  "هل يمكن العمل بدون شهادة",
  "Gammal Tech العمل في",
  'من أين أبدأ تعلم البرمجة؟',
  "هل يمكن العمل بدون شهادة",
  "Gammal Tech العمل في",
  'من أين أبدأ تعلم البرمجة؟',
  "هل يمكن العمل بدون شهادة",
  "Gammal Tech العمل في",
  'من أين أبدأ تعلم البرمجة؟',



];

class faqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body:Container(
        width: double.infinity,
        height: 700,
        color: Color.fromARGB(215, 0, 118, 125),
        child:ListView.separated(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return container(index,context);
            },
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 5,
            )),),

    );
  }

  Column container(int index,var context){
    return Column(
      children: [
        if(index==0)
          containerOfTheHeadOfTheList(),
        buildCard(context,titles[index],index),
      ],
    );
  }

  Column containerOfTheHeadOfTheList(){
    return Column(
      children: [
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, top: 15),
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
                "FAQ",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }


  Card buildCard(BuildContext context,String title,int index) {
    return Card(
      margin: EdgeInsets.only(left: 15, right: 15, top: 5),
      elevation: 5,
      child: InkWell(
        onTap:(){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => faqVideoPage(titles[index])));
        } ,
        child: Container(
          padding: EdgeInsets.all(4),
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

}
