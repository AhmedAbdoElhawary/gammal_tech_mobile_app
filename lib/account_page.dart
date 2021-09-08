import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/home_page.dart';

final List<String> listOfShirtSize = [
  "Select one...",
  "XS",
  "S",
  "M",
  "L",
  "XL"
      "XXL",
  "Overflow"
];
final List<String> listOfGender = [
  "Select one...",
  "Male",
  "Female",
];
List<String> listOfDay = ["1", "2", "3"];
List<String> listOfMonth = ["11", "21", "31"];
List<String> listOfYear = ["100", "200", "300"];

class accountPage extends StatefulWidget {
  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  String dropdownValueShirtSize = 'Select one...';
  String dropdownValueGender = 'Select one...';
  String dropdownValueDay = '1';
  String dropdownValueMonth = '11';
  String dropdownValueYear = '100';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        width: double.infinity,
        height: 700,
        color: Color.fromARGB(215, 11, 108, 108),
        child: container(context),
      ),
    );
  }

  Column container(var context) {
    return Column(
      children: [
        containerOfTheHeadOfTheList(),
        buildCard(context),
      ],
    );
  }

  Column containerOfTheHeadOfTheList() {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.only(left: 5, right: 5, top: 15),
          elevation: 5,
          color: Colors.black,
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "Account Details",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Column buildCard(BuildContext context) {
    return Column(
      children: [
        buildSizedBox(),
        Container(
          alignment: Alignment.centerRight,
          child: Column(
            children: [
              buildQuestionText("T-Shirt Size"),
              buildDropDwonButton(dropdownValueShirtSize, listOfShirtSize),
              buildQuestionText("Gender"),
              buildDropDwonButton2(dropdownValueGender, listOfGender),
              buildQuestionText("Birthdate"),
              buildBirthdateButton(),
              buildTextButton(" Save Changes ", null, context),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                elevation: 3,
                child: InkWell(
                  onTap: () async {
                    textOfButton = "SIGN IN";
                    await _auth.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      " Sign Out ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Text buildQuestionText(String text) => Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
      );

  Padding buildDropDwonButton(String v, List<String> dropList) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Card(
        elevation: 5,
        child: Container(
            height: 40,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(color: Colors.black12)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValueShirtSize,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                iconSize: 20,
                elevation: 16,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
                onChanged: (n) {
                  setState(() {
                    dropdownValueShirtSize = n!;
                  });
                },
                items:
                    listOfShirtSize.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )),
      ),
    );
  }

  Padding buildDropDwonButton2(String va, List<String> dropList) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Card(
        elevation: 5,
        child: Container(
            height: 40,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(color: Colors.black12)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValueGender,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                iconSize: 20,
                elevation: 16,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
                onChanged: (n) {
                  setState(() {
                    dropdownValueGender = n!;
                  });
                },
                items: listOfGender.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )),
      ),
    );
  }

  Iterable<DropdownMenuItem<String>> buildListMap(List<String> list) {
    return list.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    });
  }

  Row buildBirthdateButton() {
    return Row(
      children: [
        birthdateDropMenu(dropdownValueDay),
        birthdateDropMenu(dropdownValueMonth),
        birthdateDropMenu(dropdownValueYear),
      ],
    );
  }

  Expanded birthdateDropMenu(String v) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 40,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(color: Colors.black12)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: v,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                iconSize: 20,
                elevation: 16,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
                onChanged: (String? newValue) {
                  setState(() {
                    v = newValue!;
                  });
                },
                items: buildListMap(v == "1"
                        ? listOfDay
                        : (v == "11" ? listOfMonth : listOfYear))
                    .toList(),
              ),
            )),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        child: Text(item),
      );

  SizedBox buildSizedBox() => SizedBox(height: 15);
}
