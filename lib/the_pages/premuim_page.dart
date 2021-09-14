import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-theBottomBarOfyoutube.dart';
import 'package:gammal_tech_mobile_app/common_ui/common_appbar.dart';
import 'package:gammal_tech_mobile_app/common_ui/common_head_card_of_text.dart';

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
}
