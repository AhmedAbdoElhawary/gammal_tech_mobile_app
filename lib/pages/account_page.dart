import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/app_bar.dart';
import 'package:gammal_tech_mobile_app/Providers/get_personal_data.dart';
import 'package:gammal_tech_mobile_app/firebase.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class accountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Container(
          width: double.infinity,
          height: 700,
          color: Color.fromARGB(215, 11, 108, 108),
          child: container(context),
        ));
  }

  SingleChildScrollView container(context) {
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
    var plus = Provider.of<Provider_GetPersonalData>(context);
    return Column(
      children: [
        buildSizedBox(),
        Container(
          alignment: Alignment.centerRight,
          child: Column(
            children: [
              buildQuestionText("Name", 25),
              buildTextFormField(plus.controlUserName, 'Your Name', context),
              buildText(
                  'Your name (in English) that would be used in certificates.'),
              buildQuestionText("Email", 25),
              buildTextFormField(plus.controlUserEmail, 'Your Email', context),
              buildText(
                  'To update your email, you should be signed in recently.'),
              buildQuestionText("Phone", 25),
              buildTextFormField(null, 'phone', context),
              buildQuestionText("T-Shirt Size", 25),
              buildDropDwonButton(
                  plus.dropdownValueShirtSize, listOfShirtSize, context),
              buildQuestionText("Gender", 25),
              buildDropDwonButton(
                  plus.dropdownValueGender, listOfGender, context),
              buildQuestionText("Birthdate", 25),
              buildBirthdateButton(context),
              buildSaveChangesTextButton(context),
              buildQuestionText("Membership", 25),
              buildQuestionText("Premium 👑", 18),
              buildQuestionText("Yearly Membership", 18),
              buildQuestionText("Expires 2 January 2023", 18),
              buildQuestionText("Your rank is 16  See more", 18),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                elevation: 3,
                child: InkWell(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool("checkForAccount", false);
                    await plus.auth.signOut();
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

  Padding buildSaveChangesTextButton(BuildContext context) {
    var plus = Provider.of<Provider_GetPersonalData>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          height: 55,
          child: TextButton(
            onPressed: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              FirestoreOperation().updateDataFirestore(
                name: plus.controlUserName.text,
                shirt: plus.dropdownValueShirtSize,
                email: plus.controlUserEmail.text,
                phone: plus.PhoneNumber,
                gender: plus.dropdownValueGender,
                birthday: plus.dropdownValueDay,
                birthmonth: plus.dropdownValueMonth,
                birthyear: plus.dropdownValueYear,
                id: plus.id,
              );
            },
            child: Text(
              " Save Changes ",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }

  Text buildText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300),
    );
  }

  Padding buildTextFormField(var controller, String text, context) {
    var plus = Provider.of<Provider_GetPersonalData>(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 5,
        bottom: 15,
      ),
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
                    '${plus.PhoneNumber}',
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

  Padding buildQuestionText(String text, double fontSize) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: fontSize != 25 ? FontWeight.normal : FontWeight.bold,
              color: Colors.white,
              fontSize: fontSize),
        ),
      );

  Padding buildDropDwonButton(String v, List<String> dropList, context) {
    var plus = Provider.of<Provider_GetPersonalData>(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 5,
        bottom: 15,
      ),
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
                value: v,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                iconSize: 20,
                elevation: 16,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
                onChanged: (n) {
                  plus.onChangedDropList(newValue: n, value: v);
                },
                items: buildListMap(v == plus.dropdownValueShirtSize
                        ? listOfShirtSize
                        : listOfGender)
                    .toList(),
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

  Row buildBirthdateButton(context) {
    var plus = Provider.of<Provider_GetPersonalData>(context);
    return Row(
      children: [
        birthdateDropMenu(plus.dropdownValueDay, context),
        birthdateDropMenu(plus.dropdownValueMonth, context),
        birthdateDropMenu(plus.dropdownValueYear, context),
      ],
    );
  }

  Expanded birthdateDropMenu(String v, context) {
    var plus = Provider.of<Provider_GetPersonalData>(context);

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
                  plus.onChangedBirthDateDropList(newValue: newValue, value: v);
                },
                items: buildListMap(v == plus.dropdownValueDay
                        ? listOfDay
                        : (v == plus.dropdownValueMonth
                            ? listOfMonth
                            : listOfYear))
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

