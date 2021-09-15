import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gammal_tech_mobile_app/the_pages/video_page.dart';
import 'package:gammal_tech_mobile_app/the_pages/waitingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Provider_GetTheVideosFromFirestore extends ChangeNotifier {
  onPressedLessonButton(context, index) {
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        if (prefs.getBool("checkForAccount") == true ||
            index == 0 ||
            index == 1 ||
            index == 2) return videoPage(index, prefs);
        return waitingPage(
            image: null, checkAnswer: false, checkAccount: false);
      }));
    });
  }
}
