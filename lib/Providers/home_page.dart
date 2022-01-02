import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/pages/faq_page.dart';
import 'package:gammal_tech_mobile_app/pages/courses_page.dart';
import 'package:gammal_tech_mobile_app/pages/home_page.dart';
import 'package:gammal_tech_mobile_app/pages/premuim_page.dart';
import 'package:gammal_tech_mobile_app/pages/waitingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Provider_animationOfButtons_HomePage extends ChangeNotifier {
  late AnimationController animationControllerStartHere =
      animationControllerValue(duration: 1200);
  late Animation<double> pulseAnimationStartHere =
      animate(animationControllerStartHere);
  late AnimationController animationControllerCourses =
      animationControllerValue(duration: 200);
  late Animation<double> pulseAnimationCourses =
      animate(animationControllerCourses);
  late AnimationController animationControllerFAQ =
      animationControllerValue(duration: 200);
  late Animation<double> pulseAnimationFAQ = animate(animationControllerFAQ);
  late AnimationController animationControllerGoPremium =
      animationControllerValue(duration: 200);
  late Animation<double> pulseAnimationGoPremium =
      animate(animationControllerGoPremium);

  initState({required context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    animationControllerStartHere = animationControllerValue(duration: 1200);
    animationControllerCourses = animationControllerValue(duration: 200);
    animationControllerFAQ = animationControllerValue(duration: 200);
    animationControllerGoPremium = animationControllerValue(duration: 200);
    pulseAnimationStartHere = animate(animationControllerStartHere);
    pulseAnimationCourses = animate(animationControllerCourses);
    pulseAnimationFAQ = animate(animationControllerFAQ);
    pulseAnimationGoPremium = animate(animationControllerGoPremium);
    listenerStartHereButtonClicked();
    listenerButtonClicked(
        context: context,
        plus: pulseAnimationCourses,
        animation: animationControllerCourses,
        movingToThePage: const CoursesPage());
    listenerButtonClicked(
        context: context,
        plus: pulseAnimationFAQ,
        animation: animationControllerFAQ,
        movingToThePage: const FaqPage());
    listenerButtonClicked(
        context: context,
        plus: pulseAnimationGoPremium,
        animation: animationControllerGoPremium,
        movingToThePage: prefs.getBool("checkForAccount") == true
            ? PremiumPage()
            : waitingPage(
                image: null,
                checkAnswer: false,
                checkAccount: false,
              ));
    notifyListeners();
  }

  dispose() {
    animationControllerStartHere.dispose();
    animationControllerCourses.dispose();
    animationControllerFAQ.dispose();
    animationControllerGoPremium.dispose();
    notifyListeners();
  }

  Animation<double> animate(controller) {
    double end;
    Cubic curve;
    if (controller == animationControllerStartHere) {
      end = 1.06;
      curve = Curves.easeIn;
    } else {
      end = 0.7;
      curve = Curves.easeInBack;
    }
    return Tween<double>(begin: 1.0, end: end)
        .animate(CurvedAnimation(parent: controller, curve: curve));
  }

  AnimationController animationControllerValue({required int duration}) =>
      AnimationController(
          vsync: HomePageState(), duration: Duration(milliseconds: duration));

  void listenerStartHereButtonClicked() {
    return pulseAnimationStartHere.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationControllerStartHere.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationControllerStartHere.forward();
      }
    });
  }

  void listenerButtonClicked(
      {required plus,
      required animation,
      required movingToThePage,
      required context}) {
    return plus.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        animation.reverse();
      else if (status == AnimationStatus.dismissed) {
        animation.stop();

        if (movingToThePage != null)
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => movingToThePage));
      }
    });
  }
}
