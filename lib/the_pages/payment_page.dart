import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-theBottomBarOfyoutube.dart';
import 'package:gammal_tech_mobile_app/common_ui/common_appbar.dart';

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
                ],
              ),
            ),
          ),
          buildTheBottomContainer(),
        ],
      ),
    );
  }
}
