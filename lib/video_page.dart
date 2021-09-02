import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/get_the_video.dart';
import 'package:video_player/video_player.dart';

class videoPage extends StatefulWidget {
  int index;
  videoPage(this.index);
  @override
  State<videoPage> createState() => _videoPageState(index);
}
class _videoPageState extends State<videoPage> {
  String dropdownValue1 = 'Select one...';
  String dropdownValue2 = 'Select one...';
  String dropdownValue3 = 'Select one...';
  String dropdownValue4 = 'Select one...';
  String dropdownValue5 = 'Select one...';
  int index;

  _videoPageState(this.index){
   print("$index ==========================================================================");
  }

  void initState() {
    super.initState();
  }

  @override
  int get hashCode => super.hashCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: new StreamBuilder(
          stream: FirebaseFirestore.instance.collection("info").snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            final docs = snapshot.data!.docs;
            var taskData = docs[index].data();

            return Container(
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
                                taskData["videoUrl"]
                            ),
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
                        margin:
                        const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                        child: Column(
                          children: [
                            Center(
                                child: Text(
                                  "Questions",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 35),
                                )),
                            buildSizedBox(),
                            Text(
                                "Answer the following questions according to what you learned from the video."),
                            buildSizedBox(),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Column(
                                children: [
                                  buildQuestionText(),
                                  buildDropDwonButton(dropdownValue1),
                                  buildQuestionText(),
                                  buildDropDwonButton(dropdownValue2),
                                  buildQuestionText(),
                                  buildDropDwonButton(dropdownValue3),
                                  buildQuestionText(),
                                  buildDropDwonButton(dropdownValue4),
                                  buildQuestionText(),
                                  buildDropDwonButton(dropdownValue5),
                                  buildSendButton(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin:
                        const EdgeInsets.only(right: 10, left: 10, bottom: 10),
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
            );
          },
      ),
    );
  }

  Card buildSendButton() {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 118, 125),
            borderRadius: BorderRadius.circular(5)),
        child: TextButton(
          onPressed: () {},
          child: Text(
            "  Send  ",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Padding buildDropDwonButton(var v) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 40,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(191, 243, 243, 243),
              border: Border.all(color: Colors.black12)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: v,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              iconSize: 20,
              elevation: 16,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w300),
              onChanged: (String? newValue) {
                setState(() {
                  v = newValue!;
                });
              },
              items: ["Select one...", 'One', 'Two', 'three', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          )),
    );
  }

  Text buildQuestionText() => Text(
        "std::cout<<\"Hello Gammal Tech\"<<std::endl;",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      );

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        child: Text(item),
      );

  SizedBox buildSizedBox() => SizedBox(height: 15);

  Text buildTextQuestion() => Text(
        "5- حل المسأله 1+1 حل المسأله 1+1 ",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      );
}
