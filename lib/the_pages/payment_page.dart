import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-theBottomBarOfyoutube.dart';
import 'package:gammal_tech_mobile_app/common_ui/common_appbar.dart';
import 'package:gammal_tech_mobile_app/common_ui/common_head_card_of_text.dart';

enum Payment {
  PAY_WITH_VISA,
  PAY_WITH_FAWRY,
}

class PaymentPage extends StatefulWidget {
  String text;
  PaymentPage(this.text);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController controllerCardNumber = TextEditingController();
  TextEditingController controllerDateExpired = TextEditingController();
  TextEditingController controllerCVC = TextEditingController();
  bool FirstPage = true;
  late bool checkVisaPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 700,
              color: Color.fromARGB(215, 11, 108, 108),
              child: Column(
                children: [
                  TheHeadCardOfText(widget.text == "upgrade"
                      ? "Lifetime (Upgrade)"
                      : "Yearly Membership (Extend)"),
                  SizedBox(
                    height: 8,
                  ),
                  FirstPage
                      ? Column(
                          children: [
                            buildPayTextButton(true),
                            buildPayTextButton(false)
                          ],
                        )
                      : Column(
                          children: [
                            buildDynamicPage(
                                checkLifetimeMembership:
                                    widget.text == "upgrade" ? true : false,
                                checkVisa: checkVisaPage)
                          ],
                        ),
                ],
              ),
            ),
          ),
          buildTheBottomContainer(),
        ],
      ),
    );
  }

  Padding buildPayTextButton(bool checkVisa) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            FirstPage = false;
            checkVisaPage = checkVisa;
          });
        },
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            height: 47,
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pay With ",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: checkVisa
                      ? Row(
                          children: [
                            Image.asset("lib/asset/images/visa_logo.png"),
                            Image.asset("lib/asset/images/mastercard.png"),
                          ],
                        )
                      : Image.asset("lib/asset/images/fawry_logo.png"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildDynamicPage(
      {required bool checkLifetimeMembership, required bool checkVisa}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6.0, left: 6),
          child: Card(
            elevation: 5,
            shadowColor: Colors.black,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              width: double.infinity,
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    buildText(checkLifetimeMembership, "Access forLifetime",
                        "Access for 4 Years"),
                    SizedBox(height: 15),
                    buildText(checkLifetimeMembership, "100000EGP (~6382 USD)",
                        "5800EGP (~370 USD)"),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6, left: 6),
          child: Card(
            elevation: 5,
            shadowColor: Colors.black,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              width: double.infinity,
              alignment: Alignment.center,
              child: Center(
              ),
            ),
          ),
        )
      ],
    );
  }
  Text buildText(
      bool checkLifetimeMembership, String firstText, String secondText) {
    return Text(
      checkLifetimeMembership ? firstText : secondText,
      style: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal),
    );
  }
}
