import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/video_page.dart';

final titles = [
  'printf',
  'Variables',
  'scanf',
  'practice 1',
  'practice 2',

];

final icons = [
  Icons.directions_bike,
  Icons.directions_boat,
  Icons.directions_bus,
  Icons.directions_car,
  Icons.directions_railway,
  Icons.directions_run,
  Icons.directions_subway,
  Icons.directions_transit,
  Icons.directions_walk
];

class cProgrammingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:Container(
        width: double.infinity,
        height: 700,
        color: Color.fromARGB(215, 1, 82, 69),
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
        buildPadding(index),
        buildCard(context,titles[index],index),
      ],
    );
  }

  Column containerOfTheHeadOfTheList(){
    return Column(
      children: [
        Card(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
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
                "C Programming",
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
        Card(
          margin: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          elevation: 5,
          child: TextButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CoursesPage()));
            },
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Your first step in computer science and becoming a software engineer.\nDevelop your programming skills by learning C: one of the most fundamental programming languages.",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
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
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => videoPage(index)));
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "the first lesson",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPadding(int index) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 33,
          width: double.infinity,
          child: Center(
              child: Text(
                "Lesson ${index+1}",
                style: TextStyle(color: Colors.white, fontSize: 23),
              )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromARGB(200, 8, 43, 34),
          ),
        ),
      ),
    );
  }
}
