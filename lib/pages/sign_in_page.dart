import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/app_bar.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/head_card_of_text.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/the_bottom_bar_of_youtube.dart';
import 'package:gammal_tech_mobile_app/Providers/sign_in_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var plus = Provider.of<Provider_SignIn>(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromARGB(215, 11, 108, 108),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    headCardOfText("Sign In"),
                    const Text(
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
                            key: plus.scaffoldKey,
                            padding: const EdgeInsets.all(8.0),
                            child: plus.showLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : plus.currentState ==
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
    var plus = Provider.of<Provider_SignIn>(context);

    return Column(
      children: [
        const Text(
          "Enter your phone number",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        IntlPhoneField(
          controller: plus.phoneController,
          decoration: const InputDecoration(
            hintText: "Phone Number",
          ),
          onChanged: (phone) {
            plus.zd = phone.countryCode.toString();
          },
          onCountryChanged: (phone) {
            plus.zd = phone.countryCode.toString();
          },
        ),
        Card(
          color: const Color.fromARGB(215, 11, 108, 108),
          margin: const EdgeInsets.all(10),
          elevation: 3,
          child: InkWell(
            onTap: () async {
              plus.verifyNumber();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                "  VERIFY  ",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        const Text(
          "By tapping Verify, you are indicating that you accept our Terms of Service and Privacy Policy. An SMS may be sent. Message & data rates may apply.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  getOtpCode(context) {
    var plus = Provider.of<Provider_SignIn>(context);

    return Column(
      children: [
        const Text(
          "Verify your phone number",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: plus.otpController,
          decoration: const InputDecoration(
            hintText: "6-digit code",
          ),
        ),
        Row(
          children: [
            Card(
              color: const Color.fromARGB(215, 11, 108, 108),
              margin: const EdgeInsets.all(10),
              elevation: 3,
              child: InkWell(
                onTap: () async {
                  plus.otpNumber(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
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
              margin: const EdgeInsets.all(10),
              elevation: 3,
              child: InkWell(
                onTap: () async {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
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
        const Text(
          "By tapping Verify, you are indicating that you accept our Terms of Service and Privacy Policy. An SMS may be sent. Message & data rates may apply.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
