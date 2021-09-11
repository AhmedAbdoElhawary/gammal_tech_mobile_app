import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/Firebase/firebase.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/home_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class signInPage extends StatefulWidget {
  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final phoneController = TextEditingController();
  late String zd;
  final otpController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String finalNumber = "";
  FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false,
        );
        CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('users');
        QuerySnapshot querySnapshot = await _collectionRef.get();
        int i = 0;
        for (i = 0; i < querySnapshot.docs.length; i++) {
          if (querySnapshot.docs[i]["phone"] == user!.phoneNumber) break;
          else if(i == querySnapshot.docs.length-1){
            FirestoreOperation().addDataFirestore(
              name: "",
              shirt: "",
              email: "",
              phone: user!.phoneNumber,
              gender: "",
              birthday: "",
              birthmonth: "",
              birthyear: "",
            );
          }
        }

      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color.fromARGB(215, 11, 108, 108),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TheHeadCardOfText("Sign In"),
                    Text(
                      "Enter your phone number to sign in or to sign up.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40, left: 40),
                        child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          child: Padding(
                            key: _scaffoldKey,
                            padding: const EdgeInsets.all(8.0),
                            child: showLoading
                                ? Center(child: CircularProgressIndicator())
                                : currentState ==
                                        MobileVerificationState
                                            .SHOW_MOBILE_FORM_STATE
                                    ? getMobileForm(context)
                                    : getOtpCode(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          buildTheBottomContainer()
        ],
      ),
    );
  }

  getMobileForm(context) {
    return Column(
      children: [
        Text(
          "Enter your phone number",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        IntlPhoneField(
          controller: phoneController,
          decoration: InputDecoration(
            hintText: "Phone Number",
          ),
          onChanged: (phone) {
            zd = phone.countryCode.toString();
            print(zd);
            print(phoneController);
          },
          onCountryChanged: (phone) {
            zd = phone.countryCode.toString();
            print(zd);
            print(phoneController);
          },
        ),
        Text(
          "By tapping Verify, you are indicating that you accept our Terms of Service and Privacy Policy. An SMS may be sent. Message & data rates may apply.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  getOtpCode(context) {
    return Column(
      children: [
        Text(
          "Verify your phone number",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          controller: otpController,
          decoration: InputDecoration(
            hintText: "6-digit code",
          ),
        ),
        Row(
          children: [
            Card(
              color: Color.fromARGB(215, 11, 108, 108),
              margin: EdgeInsets.all(10),
              elevation: 3,
              child: InkWell(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  PhoneAuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationId,
                          smsCode: otpController.text);
                  signInWithPhoneAuthCredential(phoneAuthCredential);
                  prefs.setString("textOfButton", "My Account");
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "  CONTINUE  ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.all(10),
              elevation: 3,
              child: InkWell(
                onTap: () async {},
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "  CANCEL  ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(215, 11, 108, 108),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          "By tapping Verify, you are indicating that you accept our Terms of Service and Privacy Policy. An SMS may be sent. Message & data rates may apply.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
