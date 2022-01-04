import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/text_button_of_menu.dart';
import 'package:gammal_tech_mobile_app/pages/faq_page.dart';
import 'package:gammal_tech_mobile_app/pages/contact_us_page.dart';
import 'package:gammal_tech_mobile_app/pages/courses_page.dart';
import 'package:gammal_tech_mobile_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI.dart';

AppBar buildAppBar(context) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.teal[800]),
    elevation: 5,
    title: TextButton(
      onPressed: () {
        if (context != const HomePage()) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (Route<dynamic> route) => false,
          );
        }
      },
      child: Text(
        "Gammal Tech",
        style: TextStyle(color: Colors.teal[800], fontSize: 30),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          bool checkAccount = prefs.getBool("checkForAccount") == true;
          showGeneralDialog(
            context: context,
            barrierDismissible: true,
            transitionDuration: const Duration(milliseconds: 500),
            barrierLabel: MaterialLocalizations.of(context).dialogLabel,
            barrierColor: Colors.black.withOpacity(0),
            pageBuilder: (context, _, __) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 52.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        color: const Color.fromARGB(0, 255, 255, 255),
                        child: Card(
                          color: const Color.fromARGB(240, 255, 255, 255),
                          margin: const EdgeInsets.only(),
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              const ListTile(title: Text('Premium')),
                              listTileOfDropMenu(
                                  context, 'Courses', const CoursesPage()),
                              const ListTile(title: Text('Masterclass')),
                              listTileOfDropMenu(context, 'FAQ', const FaqPage()),
                              listTileOfDropMenu(
                                  context, 'Content', ContactUs()),
                              buildTextButtonOfMenu(context, checkAccount)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ).drive(Tween<Offset>(
                  begin: const Offset(0, -1.0),
                  end: Offset.zero,
                )),
                child: child,
              );
            },
          );
        },
        icon: const Icon(
          Icons.menu,
          textDirection: TextDirection.rtl,
          color: Colors.black87,
        ),
      ),
    ],
  );
}
