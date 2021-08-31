import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/get_the_video.dart';
import 'package:video_player/video_player.dart';

class videoPage extends StatefulWidget {
  @override
  State<videoPage> createState() => _videoPageState();
}

class _videoPageState extends State<videoPage> {
  String dropdownValue1 = 'One';
  String dropdownValue2 = 'One';
  String dropdownValue3 = 'One';
  String dropdownValue4 = 'One';
  String dropdownValue5 = 'One';

  void initState() {
    super.initState();
  }
  @override
  int get hashCode => super.hashCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        width: double.infinity,
        height: 700,
        color: Color.fromARGB(255, 0, 118, 125),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  elevation: 5,
                  color: Colors.black,
                  child: Container(
                    height: 47,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "lesson video",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, right: 15, left: 15, bottom: 10),
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 186,
                    child: ChewieListItem(
                      videoPlayerController: VideoPlayerController.network(
                          "https://firebasestorage.googleapis.com/v0/b/gammal-tech-mobile-app.appspot.com/o/Gammal%20Tech%20-%20C.mp4?alt=media&token=31ca2d8d-236f-42dc-874b-a5c3c01486d7"),
                      looping: true,
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    height: 55,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Start Coding",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          "Exercises",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        )),
                        buildSizedBox(),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: [
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                              buildTextQuestion(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10,left: 10,bottom: 10),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        "Questions",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      )),
                      buildSizedBox(),
                      Text("Answer the following questions according to what you learned from the video."),
                      buildSizedBox(),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            buildQuestionText(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 40,
                                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(191, 243, 243, 243),
                                    border: Border.all(color: Colors.black12)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: dropdownValue1,
                                    isExpanded: true,

                                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                    iconSize: 20,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black87,fontSize: 17,fontWeight: FontWeight.w300),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue1 = newValue!;
                                      });
                                    },
                                    items:["Select one...",'One', 'Two', 'Free', 'Four']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ),
                            ),
                            buildQuestionText(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 40,
                                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(191, 243, 243, 243),
                                      border: Border.all(color: Colors.black12)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: dropdownValue2,
                                      isExpanded: true,

                                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                      iconSize: 20,
                                      elevation: 16,
                                      style: const TextStyle(color: Colors.black87,fontSize: 17,fontWeight: FontWeight.w300),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue2 = newValue!;
                                        });
                                      },
                                      items:["Select one...",'One', 'Two', 'Free', 'Four']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  )
                              ),
                            ),
                            buildQuestionText(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 40,
                                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(191, 243, 243, 243),
                                      border: Border.all(color: Colors.black12)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: dropdownValue3,
                                      isExpanded: true,

                                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                      iconSize: 20,
                                      elevation: 16,
                                      style: const TextStyle(color: Colors.black87,fontSize: 17,fontWeight: FontWeight.w300),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue3 = newValue!;
                                        });
                                      },
                                      items:["Select one...",'One', 'Two', 'Free', 'Four']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  )
                              ),
                            ),
                            buildQuestionText(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 40,
                                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(191, 243, 243, 243),
                                      border: Border.all(color: Colors.black12)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: dropdownValue4,
                                      isExpanded: true,

                                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                      iconSize: 20,
                                      elevation: 16,
                                      style: const TextStyle(color: Colors.black87,fontSize: 17,fontWeight: FontWeight.w300),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue4 = newValue!;
                                        });
                                      },
                                      items:["Select one...",'One', 'Two', 'Free', 'Four']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  )
                              ),
                            ),
                            buildQuestionText(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 40,
                                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(191, 243, 243, 243),
                                      border: Border.all(color: Colors.black12)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: dropdownValue5,
                                      isExpanded: true,

                                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                      iconSize: 20,
                                      elevation: 16,
                                      style: const TextStyle(color: Colors.black87,fontSize: 17,fontWeight: FontWeight.w300),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue5 = newValue!;
                                        });
                                      },
                                      items:["Select one...",'One', 'Two', 'Free', 'Four']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  )
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.all(10),
                              elevation: 5,
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(color:Color.fromARGB(255, 0, 118, 125),borderRadius: BorderRadius.circular(5) ),
                                child: TextButton(onPressed: (){},child: Text("  Send  ",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w400,color: Colors.white),),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10,left: 10,bottom: 10),
                  width: double.infinity,
                  height: 700,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text buildQuestionText() => Text("std::cout<<\"Hello Gammal Tech\"<<std::endl;",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),);

  DropdownMenuItem<String> buildMenuItem(String item)=>DropdownMenuItem(child: Text(item),);

  SizedBox buildSizedBox() => SizedBox(height: 15);

  Text buildTextQuestion() => Text(
        "5- حل المسأله 1+1 حل المسأله 1+1 ",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      );
}


