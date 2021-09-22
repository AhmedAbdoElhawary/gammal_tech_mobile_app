import 'package:flutter/material.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';

Card TheHeadCardOfText(String title) {
  return Card(
    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
    elevation: 5,
    color: Colors.black,
    child: Container(
      height: 47,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
Padding buildTheLessonVideo(bool checkForPadding, bool checkForHeight,String videoId) {
  return Padding(
    padding: checkForPadding
        ? const EdgeInsets.only(top: 15, right: 10, left: 10)
        : const EdgeInsets.only(top: 15, right: 15, left: 15),
    child: Container(
      color: Colors.white,
      width: double.infinity,
      height: checkForHeight ? 170 : 186,
      child: VimeoPlayer(videoId: videoId),
      // child: VimeoPlayer(
      //   videoId: videoId,
      // ),
    ),
  );
}