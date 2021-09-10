import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gammal_tech_mobile_app/c_programming_page.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/waitingPage.dart';

List<String> dropList = ["Select one...", 'One', 'Two', 'three', 'Four'];

class videoPage extends StatefulWidget {
  int index;
  videoPage(this.index);
  @override
  State<videoPage> createState() => _videoPageState(index);
}

class _videoPageState extends State<videoPage> {
  int index;

  _videoPageState(this.index);
  String dropdownValue1 = "Select one...";
  void initState() {
    super.initState();
  }

  @override
  int get hashCode => super.hashCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: new StreamBuilder(
        stream: FirebaseFirestore.instance.collection("info").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final docs = snapshot.data!.docs;
          var taskData = docs[0].data();

          return buildContainer(taskData);
        },
      ),
    );
  }

  Column buildContainer(Map<String, dynamic> taskData) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: 700,
            color: Color.fromARGB(215, 11, 108, 108),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TheHeadCardOfText(titles[index]),
                    buildTheVideo(taskData),
                    buildTextButton("Start Coding", context, null),
                    buildContainerOfExercises(),
                    buildContainerOfQuestion(),
                    buildEmptyContainer(),
                    buildTheBottomContainer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container buildEmptyContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      width: double.infinity,
      height: 700,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
    );
  }

  Container buildContainerOfQuestion() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: Column(
        children: [
          buildTheHeadText("Questions"),
          buildSizedBox(),
          Text(
            "Answer the following questions according to what you learned from the video.",
            textAlign: TextAlign.center,
          ),
          buildSizedBox(),
          Container(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                buildQuestions(),
                buildDropDwonButton(),
                buildSendButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildDropDwonButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          height: 40,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(191, 243, 243, 243),
              border: Border.all(color: Colors.black12)),
          child: buildDropdownButton()),
    );
  }

  DropdownButtonHideUnderline buildDropdownButton() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: dropdownValue1,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        iconSize: 20,
        elevation: 16,
        style: const TextStyle(
            color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w300),
        onChanged: (n) {
          setState(() {
            dropdownValue1 = n!;
          });
        },
        items: ["Select one...", 'Hello Gammal Tech', 'Error']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Directionality buildContainerOfExercises() {
    return Directionality(
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
            buildTheHeadText("Exercises"),
            buildSizedBox(),
            Container(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  buildTextExercises(),
                  buildTextExercises(),
                  buildTextExercises(),
                  buildTextExercises(),
                  buildTextExercises(),
                  buildTextExercises(),
                  buildTextExercises(),
                  buildTextExercises(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center buildTheHeadText(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
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
            color: Color.fromARGB(215, 0, 118, 125),
            borderRadius: BorderRadius.circular(5)),
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => waitingPage(
                          image: dropdownValue1 == "Hello Gammal Tech"
                              ? "https://uploads-ssl.webflow.com/5d2cb3382be6ba1741dc013c/5e3fcd02b8df234d21a85952_handshake.gif"
                              : "https://uploads-ssl.webflow.com/5d2cb3382be6ba1741dc013c/5e3e7bea42782820e8fa79c0_we%20shaking%20head%20omptimized.gif",
                          checkAnswer: dropdownValue1 == "Hello Gammal Tech"
                              ? true
                              : false,
                        )));
          },
          child: Text(
            "  Send  ",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Text buildQuestions() => Text(
        "std::cout<<\"Hello Gammal Tech\"<<std::endl;",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      );

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        child: Text(item),
      );

  SizedBox buildSizedBox() => SizedBox(height: 15);

  Text buildTextExercises() => Text(
        "5- حل المسأله 1+1 حل المسأله 1+1 ",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      );
}
