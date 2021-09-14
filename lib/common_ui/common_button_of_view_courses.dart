import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-theBottomBarOfyoutube.dart';

Card buildTextButtonOfViewCourses(String text, page, context) {
  return Card(
    elevation: 5,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      height: 55,
      child: TextButton(
        onPressed: () {
          if(text=="Start Coding")
            launchURL("https://replit.com/@GammalTechTeam/C-Repl-Gammal-Tech");
          if (page != null)
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
    ),
  );
}