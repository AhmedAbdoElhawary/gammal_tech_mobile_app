import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/FAQ_video_page.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';

final titles_faq = [
  " هل يمكن العمل بدون شهادة ",
  " Gammal Tech العمل في ",
  ' من أين أبدأ تعلم البرمجة؟ ',
  " هل يمكن العمل بدون شهادة ",
  " Gammal Tech العمل في ",
  " هل يمكن العمل بدون شهادة ",
  " Gammal Tech العمل في ",
  ' من أين أبدأ تعلم البرمجة؟ ',
  " هل يمكن العمل بدون شهادة ",
  " Gammal Tech العمل في ",
  " هل يمكن العمل بدون شهادة ",
  " Gammal Tech العمل في ",
  ' من أين أبدأ تعلم البرمجة؟ ',
  " هل يمكن العمل بدون شهادة ",
  " Gammal Tech العمل في ",
  " هل يمكن العمل بدون شهادة ",
  " Gammal Tech العمل في ",
  ' من أين أبدأ تعلم البرمجة؟ ',
  " هل يمكن العمل بدون شهادة ",
  " Gammal Tech العمل في ",
];

class faqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body:Container(
        width: double.infinity,
        height: 700,
        color: Color.fromARGB(215, 11, 108, 108),
        child:ListView.separated(
            itemCount: titles_faq.length,
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
          TheHeadCardOfText("FAQ"),
        buildCard(context,titles_faq[index],index),
        SizedBox(height: 10,),
        if (titles_faq.length - 1 == index) buildTheBottomContainer(),
      ],
    );
  }

  Card buildCard(BuildContext context,String title,int index) {
    return Card(
      margin: EdgeInsets.only(left: 15, right: 15, ),
      elevation: 5,
      child: InkWell(
        onTap:(){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => faqVideoPage(titles_faq[index])));
        } ,
        child: Container(
          padding: EdgeInsets.all(3),
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
