import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/courses_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationControllerStartHere;
  late Animation<double> pulseAnimationStartHere;
  late AnimationController _animationControllerCourses;
  late Animation<double> pulseAnimationCourses;
  late AnimationController _animationControllerFAQ;
  late Animation<double> pulseAnimationFAQ;
  late AnimationController _animationControllerGoPremium;
  late Animation<double> pulseAnimationGoPremium;

  @override
  void initState() {
    super.initState();
    _animationControllerStartHere = animationControllerValue(1200);
    _animationControllerCourses = animationControllerValue(200);
    _animationControllerFAQ = animationControllerValue(200);
    _animationControllerGoPremium = animationControllerValue(200);

    pulseAnimationStartHere = animate(_animationControllerStartHere);
    pulseAnimationCourses = animate(_animationControllerCourses);
    pulseAnimationFAQ = animate(_animationControllerFAQ);
    pulseAnimationGoPremium = animate(_animationControllerGoPremium);
    ListenerButtonClicked(
        plus: pulseAnimationStartHere,
        animation: _animationControllerStartHere,
        movingToThePage: null);
    ListenerButtonClicked(
        plus: pulseAnimationCourses,
        animation: _animationControllerCourses,
        movingToThePage: CoursesPage());
    ListenerButtonClicked(
        plus: pulseAnimationFAQ,
        animation: _animationControllerFAQ,
        movingToThePage: null);
    ListenerButtonClicked(
        plus: pulseAnimationGoPremium,
        animation: _animationControllerGoPremium,
        movingToThePage: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildCenterBody(context),
    );
  }

  Animation<double> animate(controller) {
    double end;
    var curve;
    if (controller == _animationControllerStartHere) {
      end = 1.06;
      curve = Curves.easeIn;
    } else {
      end = 0.7;
      curve = Curves.easeInBack;
    }
    return Tween<double>(begin: 1.0, end: end)
        .animate(CurvedAnimation(parent: controller, curve: curve));
  }

  AnimationController animationControllerValue(int d) =>
      AnimationController(vsync: this, duration: Duration(milliseconds: d));

  void ListenerButtonClicked(
      {required plus, required animation, required movingToThePage}) {
    return plus.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        animation.reverse();
      else if (status == AnimationStatus.dismissed) {
        if (plus == pulseAnimationStartHere)
          animation.forward();
        else
          animation.stop();

        if (movingToThePage != null)
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => movingToThePage));
      }
    });
  }

  Center buildCenterBody(BuildContext context) {
    setState(() {
      _animationControllerStartHere.forward();
    });
    return Center(
      child: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                "https://uploads-ssl.webflow.com/5d2cb3382be6ba1741dc013c/5e070b1376f1c636adab9240_Web%201920%20%E2%80%93%201.jpg",
                fit: BoxFit.cover,
              )),
          Container(
            width: double.infinity,
            color: Color.fromARGB(215, 0, 118, 125),
            child: buildColumn(context),
          ),
        ],
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildJoinUsText("The only place to master software engineering."),
        buildCard(context, "START HERE"),
        buildCard(context, "Courses"),
        buildCard(context, "FAQ"),
        buildCard(context, "Go Premium"),
        buildRowText("Facebook"),
        buildRowText("YouTube"),
      ],
    );
  }

  ScaleTransition buildCard(BuildContext context, String text) {
    return ScaleTransition(
      scale: text == "Courses"
          ? pulseAnimationCourses
          : (text == "FAQ"
              ? pulseAnimationFAQ
              : (text == "Go Premium"
                  ? pulseAnimationGoPremium
                  : pulseAnimationStartHere)),
      child: Card(
        color: text == "Go Premium"
            ? Colors.yellow[600]
            : (text == "START HERE"
                ? Color.fromARGB(235, 4, 69, 71)
                : Colors.white),
        margin: text == "Go Premium"
            ? EdgeInsets.all(15)
            : (text == "START HERE"
                ? EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10)
                : EdgeInsets.only(left: 15, right: 15, top: 10)),
        elevation: 10,
        child: TextButton(
          onPressed: () {
            setState(() {
              AnimationController animation = text == "Courses"
                  ? _animationControllerCourses
                  : (text == "FAQ"
                      ? _animationControllerFAQ
                      : (text == "START HERE"
                          ? _animationControllerStartHere
                          : _animationControllerGoPremium));
              animation.forward();
            });
          },
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 25,
                  color: text == "START HERE" ? Colors.white : Colors.black,
                  fontWeight: text == "Go Premium"
                      ? FontWeight.bold
                      : (text == "START HERE"
                          ? FontWeight.w300
                          : FontWeight.w400)),
            ),
          ),
        ),
      ),
    );
  }

  Row buildRowText(String link) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildJoinUsText("Join us on "),
        InkWell(
          onTap: () {},
          child: Text(
            link,
            style: TextStyle(
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
      style: TextStyle(
          color: Colors.white70,
          fontSize: 15,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300),
    );
  }
}
