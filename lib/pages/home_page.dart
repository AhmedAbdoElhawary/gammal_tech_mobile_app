import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/app_bar.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/the_bottom_bar_of_youtube.dart';
import 'package:gammal_tech_mobile_app/Providers/home_page.dart';
import 'package:gammal_tech_mobile_app/pages/start_here_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<Provider_animationOfButtons_HomePage>(context, listen: false)
          .initState(context: context);
    });
    super.initState();
  }

  @override
  dispose() {
    Future.delayed(Duration.zero, () {
      Provider.of<Provider_animationOfButtons_HomePage>(context, listen: false)
          .dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildCenterBody(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 11, 120, 105),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(9),
                bottomLeft: Radius.circular(40),
                topLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        onPressed: () {},
        child: const Icon(
          Icons.chat_rounded,
        ),
      ),
    );
  }

  Center buildCenterBody(BuildContext context) {
    Provider.of<Provider_animationOfButtons_HomePage>(context)
        .animationControllerStartHere
        .forward();
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                buildContainerOfImage(),
                buildContainerOfButtons(context),
              ],
            ),
          ),
          buildTheBottomContainer(),
        ],
      ),
    );
  }

  Container buildContainerOfButtons(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.maxFinite,
      color: const Color.fromARGB(226, 11, 108, 108),
      child: buildColumn(context),
    );
  }

  Container buildContainerOfImage() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          "asset/images/home_photo.jpg",
          fit: BoxFit.cover,
        ));
  }

  Center buildColumn(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildJoinUsText("The only place to master software engineering."),
            buildCard(context, "START HERE"),
            buildCard(context, "Courses"),
            buildCard(context, "FAQ"),
            buildCard(context, "Go Premium"),
            buildRowOfLinks("Facebook"),
            buildRowOfLinks("YouTube"),
          ],
        ),
      ),
    );
  }

  ScaleTransition buildCard(BuildContext context, String text) {
    var plus = Provider.of<Provider_animationOfButtons_HomePage>(context);
    return ScaleTransition(
      scale: text == "Courses"
          ? plus.pulseAnimationCourses
          : (text == "FAQ"
              ? plus.pulseAnimationFAQ
              : (text == "Go Premium"
                  ? plus.pulseAnimationGoPremium
                  : plus.pulseAnimationStartHere)),
      child: Card(
        color: text == "Go Premium"
            ? Colors.yellow[600]
            : (text == "START HERE"
                ? const Color.fromARGB(235, 4, 69, 71)
                : Colors.white),
        margin: text == "Go Premium"
            ? const EdgeInsets.all(15)
            : (text == "START HERE"
                ? const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 10)
                : const EdgeInsets.only(left: 15, right: 15, top: 10)),
        elevation: 10,
        child: TextButton(
          onPressed: () {
            AnimationController animation = text == "Courses"
                ? plus.animationControllerCourses
                : (text == "FAQ"
                    ? plus.animationControllerFAQ
                    : (text == "START HERE"
                        ? plus.animationControllerStartHere
                        : plus.animationControllerGoPremium));
            animation.forward();
            if (text == "START HERE") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StartHerePage(text)));
            }
          },
          child: buildContainerOfText(text),
        ),
      ),
    );
  }

  Container buildContainerOfText(String text) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 25,
            color: text == "START HERE" ? Colors.white : Colors.black,
            fontWeight: text == "Go Premium"
                ? FontWeight.bold
                : (text == "START HERE" ? FontWeight.w300 : FontWeight.w400)),
      ),
    );
  }

  Row buildRowOfLinks(String link) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildJoinUsText("Join us on "),
        InkWell(
          onTap: () {
            launchURL(link == "Facebook"
                ? "https://www.facebook.com/gammal.tech"
                : "https://www.youtube.com/gammaltech?sub_confirmation=1");
          },
          child: Text(
            link,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 15,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold),
          ),
        ),
        buildJoinUsText("!"),
      ],
    );
  }

  Text buildJoinUsText(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300),
    );
  }
}
