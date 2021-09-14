import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-theBottomBarOfyoutube.dart';
import 'package:gammal_tech_mobile_app/common_ui/common_appbar.dart';
import 'package:gammal_tech_mobile_app/common_ui/common_head_card_of_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
