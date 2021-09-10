import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
var listOfDay = new List<String>.generate(31, (i) => "${i + 1}");
var listOfMonth = new List<String>.generate(12, (i) => "${i + 1}");
var listOfYear = new List<String>.generate(67, (i) => "${1950 + i}");

class accountPage extends StatefulWidget {
  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  var controlUserName = TextEditingController();
  var controlUserEmail = TextEditingController();

  String dropdownValueShirtSize = 'Select one...';
  String dropdownValueGender = 'Select one...';
  String dropdownValueDay = '4';
  String dropdownValueMonth = '4';
  String dropdownValueYear = '2001';
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

  SingleChildScrollView container(var context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          containerOfTheHeadOfTheList(),
          buildCard(context),
        ],
      ),
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
              buildQuestionText("Name",25),
              buildTextFormField(controlUserName, 'Your Name'),
              buildText('Your name (in English) that would be used in certificates.'),
              buildQuestionText("Email",25),
              buildTextFormField(controlUserEmail, 'Your Email'),
              buildText('To update your email, you should be signed in recently.'),
              buildQuestionText("Phone",25),
              buildTextFormField(null, 'phone'),
              buildQuestionText("T-Shirt Size",25),
              buildDropDwonButton(dropdownValueShirtSize, listOfShirtSize),
              buildQuestionText("Gender",25),
              buildDropDwonButton(dropdownValueGender, listOfGender),
              buildQuestionText("Birthdate",25),
              buildBirthdateButton(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: buildTextButton(" Save Changes ", HomePage(), context),
              ),
              buildQuestionText("Membership",25),
              buildQuestionText("Premium 👑",18),
              buildQuestionText("Yearly Membership",18),
              buildQuestionText("Expires 2 January 2023",18),
              buildQuestionText("Your rank is 16  See more",18),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                elevation: 3,
                child: InkWell(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("textOfButton", "SIGN IN");
                    await _auth.signOut();
                    // user=null;
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

  Text buildText(String text) {
    return Text(
      text,textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300),
    );
  }

  Padding buildTextFormField(var controller, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 5,bottom: 15,),
      child: Card(
        elevation: 5,
        child: Container(
          height: 40,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              border: Border.all(color: Colors.black12)),
          child: text == 'phone'
              ? Center(
                child: Text(
                    '${user!.phoneNumber}',
                    style: TextStyle(color: Colors.black87),
                  ),
              )
              : TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: text,
                    hintStyle: TextStyle(color: Colors.black26),
                  ),
                ),
        ),
      ),
    );
  }

  Padding buildQuestionText(String text,double fontSize) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
          text,
          style: TextStyle(
              fontWeight:fontSize!=25?FontWeight.normal:FontWeight.bold, color: Colors.white, fontSize: fontSize),
        ),
  );

  Padding buildDropDwonButton(String v, List<String> dropList) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 5,bottom: 15,),
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
                value: v == dropdownValueShirtSize
                    ? dropdownValueShirtSize
                    : dropdownValueGender,
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
                    v == dropdownValueShirtSize
                        ? dropdownValueShirtSize = n!
                        : dropdownValueGender = n!;
                  });
                },
                items: listOfShirtSize
                    .map<DropdownMenuItem<String>>((String value) {
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
                    v == dropdownValueDay
                        ? dropdownValueDay = newValue!
                        : (v == dropdownValueMonth
                            ? dropdownValueMonth = newValue!
                            : dropdownValueYear = newValue!);
                  });
                },
                items: buildListMap(v == dropdownValueDay
                        ? listOfDay
                        : (v == dropdownValueMonth ? listOfMonth : listOfYear))
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
