import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/app_bar.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/head_card_of_text.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/the_bottom_bar_of_youtube.dart';
import 'package:gammal_tech_mobile_app/pages/payment_page.dart';

class premiumPage extends StatelessWidget {
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
                  TheHeadCardOfText("Manage Membership"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildTextButton(
                        "upgrade",
                        context,
                      ),
                      buildTextButton(
                        "Extend",
                        context,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          buildTheBottomContainer(),
        ],
      ),
    );
  }

  Card buildTextButton(String text, context) {
    return Card(
      elevation: 5,
      child: Container(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentPage(text)),
              );
            },
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 25),
            )),
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 213, 0, 1.0),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
